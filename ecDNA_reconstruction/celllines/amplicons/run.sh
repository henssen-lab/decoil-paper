

# Merge all summaries


echo -e "sample\tgenome\tdecoil\tcirc_id\tchr_origin\tsize(MB)\tlabel\ttopology_idx\ttopology_name\testimated_proportions" > summary_celllines_decoil_v108_01072023.txt
grep -v "circ_id" ../../Process/*/*/decoil_v108_01072023/summary.txt | awk -F":" '{split($1,a,"/"); print a[4]"\t"a[5]"\t"a[6]"\t"$2}' >> summary_celllines_decoil_v108_01072023.txt


# Merge all reconstructed circles

echo -e "sample\tgenome\tdecoil\tchr\tstart\tend\tcirc_id\tfragment_id\tstrand\tcoverage\testimated_proportions" > reconstruct_all_celllines_decoil_v108_01072023.txt
grep -v "circ_id" ../../Process/*/*/decoil_v108_01072023/reconstruct.bed | awk -F":" '{split($1,a,"/"); print a[4]"\t"a[5]"\t"a[6]"\t"$2}' >> reconstruct_all_celllines_decoil_v108_01072023.txt

# Merge all reconstructed ecDNA

echo -e "sample\tgenome\tdecoil\tchr\tstart\tend\tcirc_id\tfragment_id\tstrand\tcoverage\testimated_proportions" > reconstruct_ecDNA_celllines_decoil_v108_01072023.txt
grep -v "circ_id" ../../Process/*/*/decoil_v108_01072023/reconstruct.ecDNA.bed | awk -F":" '{split($1,a,"/"); print a[4]"\t"a[5]"\t"a[6]"\t"$2}' >> reconstruct_ecDNA_celllines_decoil_v108_01072023.txt


