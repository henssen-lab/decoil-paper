"""
Created using PyCharm
@author: Madalina Giurgiu
@date: 12:11 PM 9/20/22
"""
import argparse
import os
import pandas as pd
from Bio import SeqIO
from Bio.Seq import Seq
from Bio.SeqRecord import SeqRecord
import numpy as np

FORMAT_DECOIL = "decoil"
FORMAT_BED = "bed"

def convert_bed2fasta(regionsfile, fastafile, ref_genome, format="decoil"):
	"""
	Convert a genome regions file to fasta format.

	Arguments:
		regionsfile (str): Region file. Format can be:
						   - bed file (chr start end name)
						   - decoil format (chr, start, stop, circleid, fragnr, strand, cov, score)
		fastafile (str): Output file containing the sequence
		ref_genome (str): Reference genome fasta file
		format (str): Input format {bed, decoil}

	"""

	# parse faste file and turn into dictionary
	records = SeqIO.to_dict(SeqIO.parse(open(ref_genome), 'fasta'))

	circleseq_records = []
	sequence_circle = ""
	lastid = -1

	if format not in [FORMAT_DECOIL, FORMAT_BED]:
		raise ValueError("""Format not correct. Please use [{},{}]""".format(FORMAT_DECOIL, FORMAT_BED))

	with open(regionsfile) as f:
		for line in f:
			if line.startswith("#"):
				continue

			if format == FORMAT_DECOIL:
				chr, start, stop, name, fragnr, strand, cov, score = line.split()

				start = int(start)
				stop = int(stop)

			else:
				arr = line.split()
				chr, start, stop, strand, name = arr[0], arr[1], arr[2], arr[3], arr[4]

				start = int(start)
				stop = int(stop)

			if lastid == -1:
				lastid = name

			# if a complete circle was constructed
			if lastid != name:
				circle_record = SeqRecord(Seq(sequence_circle), id=str(lastid), description=str(lastid))
				circleseq_records.append(circle_record)
				sequence_circle = ""
				lastid = name

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

if __name__ == '__main__':

	parser = argparse.ArgumentParser()
	parser.add_argument('-i', '--input', help='Bed file', required=True)
	parser.add_argument('-o', '--output', help='Output fasta', required=True)
	parser.add_argument('-r', '--genome', help='Reference genome (fasta)', required=True)
	parser.add_argument('-f', '--format', help='Format input {decoil,bed}', required=False, default="decoil")
	args = parser.parse_args()
	convert_bed2fasta(args.input, args.output, args.genome, format=args.format)
