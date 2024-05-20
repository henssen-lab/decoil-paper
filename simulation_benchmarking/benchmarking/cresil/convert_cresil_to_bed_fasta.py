import re
import os
import pandas as pd
import argparse
from Bio import SeqIO
from Bio.Seq import Seq
from Bio.SeqRecord import SeqRecord


def convert_bed2fasta(bedfile, fastafile, ref_genome):
	"""
	Convert a graph path bed to fasta.
	"""

	# parse faste file and turn into dictionary
	records = SeqIO.to_dict(SeqIO.parse(open(ref_genome), 'fasta'))

	circleseq_records = []
	sequence_circle = ""
	lastid = -1

	with open(bedfile) as f:
		for line in f:
			if line.startswith("#"):
				continue
			# "#chr","start","end","circ_id","fragment_id","strand","coverage"
			chr, start, stop, circ_id, fragnr, strand, cov = line.split()

			start = int(start)
			stop = int(stop)

			if lastid == -1:
				lastid = circ_id

			# if a complete circle was constructed
			if lastid != circ_id:
				circle_record = SeqRecord(Seq(sequence_circle), id=str(lastid), description=str(lastid))
				circleseq_records.append(circle_record)
				sequence_circle = ""
				lastid = circ_id

			# get sequence
			long_seq_record = records[chr]
			long_seq = long_seq_record.seq

			short_seq = str(long_seq)[start:stop]
			if strand == "-":
				short_seq = str(Seq(short_seq).reverse_complement())
			sequence_circle += short_seq

	# last element
	circle_record = SeqRecord(Seq(sequence_circle), id=str(lastid), description=str(lastid))
	circleseq_records.append(circle_record)

	# write to file
	with open(fastafile, 'w') as f:
		SeqIO.write(circleseq_records, f, 'fasta')


def convert(input, outdir, ref_genome):
	"""
	Input:
		id	merge_region	merge_len	num_region	eccdna_status	numreads	totalbase	coverage	consensus_len	consensus_status
		ec1	chr8:98276341-98578547_+,chr12:106792778-107135405_-,chr2:68654502-68923964_+,chr2:14992224-15234630_+	1156705	4	non-cyclic	77204	562011446	485.87	115766Insertion

	Output:
		bed:
		#chr	start	end	circ_id	fragment_id	strand	coverage


	"""

	os.makedirs(outdir, exist_ok=True)

	bedfile = os.path.join(outdir,"eccDNA_final.bed")
	fastafile = os.path.join(outdir, "eccDNA_final.fasta")

	df = pd.read_csv(input, header=0, sep="\t", index_col=None)
	df_output = pd.DataFrame(columns=["#chr","start","end","circ_id","fragment_id","strand","coverage"])


	for i in range(0, df.shape[0]):
		(circ_id, regions, regions_len, num_region, eccdna_status, numreads, totalbase, coverage, consensus_len, consensus_status)  = df.iloc[i,:]

		j = 0
		for item in regions.split(","):
			pos, strand = item.split('_')
			chr, start, end = re.split(r'[:\-]', pos)
			new_row = {'#chr':chr,
					   'start':int(start),
					   'end':int(end),
					   'circ_id':circ_id,
					   'fragment_id':j,
					   'strand':strand,
					   'coverage':coverage}
			j = j + 1
			df_output = df_output.append(new_row, ignore_index=True)

	df_output.to_csv(bedfile, header=True, index=False, quoting=False, sep="\t")
	convert_bed2fasta(bedfile, fastafile, ref_genome)



if __name__ ==  "__main__":

	parser = argparse.ArgumentParser()
	parser.add_argument("--input", help="Input", required=True)
	parser.add_argument("--ref", help="Reference genome", required=True)
	parser.add_argument("--outdir", help="Output directory", required=True)

	args = parser.parse_args()

	convert(args.input, args.outdir, args.ref)
