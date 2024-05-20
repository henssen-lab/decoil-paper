#!/bin/bash

# Shasta

grep "Total length  "  /data/gpfs-1/users/giurgium_c/scratch/sim_all/process/batch_*/sim_*/quast_true_shasta/report.txt | awk -F":" '{print $1"\t"$2}' | awk '{print $1"\t"$2"_len\t"$4"\tshasta"}' > c4.txt

grep "auN "  /data/gpfs-1/users/giurgium_c/scratch/sim_all/process/batch_*/sim_*/quast_true_shasta/report.txt | awk -F":" '{print $1"\t"$2}' | awk '{print $1"\t"$2"\t"$3"\tshasta"}' > c5.txt

grep "Reference length"  /data/gpfs-1/users/giurgium_c/scratch/sim_all/process/batch_*/sim_*/quast_true_shasta/report.txt | awk -F":" '{print $1"\t"$2}' | awk '{print $1"\t"$2"_len\t"$4"\tshasta"}' > c6.txt

grep "Largest contig"  /data/gpfs-1/users/giurgium_c/scratch/sim_all/process/batch_*/sim_*/quast_true_shasta/report.txt | awk -F":" '{print $1"\t"$2}' | awk '{print $1"\t"$2"_contig\t"$4"\tshasta"}' > c8.txt


# Cresil

grep "Total length  "  /data/gpfs-1/users/giurgium_c/scratch/sim_all/process/batch_*/sim_*/quast_true_cresil/report.txt | awk -F":" '{print $1"\t"$2}' | awk '{print $1"\t"$2"_len\t"$4"\tcresil"}' > c9.txt

grep "auN "  /data/gpfs-1/users/giurgium_c/scratch/sim_all/process/batch_*/sim_*/quast_true_cresil/report.txt | awk -F":" '{print $1"\t"$2}' | awk '{print $1"\t"$2"\t"$3"\tcresil"}' > c10.txt

grep "Reference length"  /data/gpfs-1/users/giurgium_c/scratch/sim_all/process/batch_*/sim_*/quast_true_cresil/report.txt | awk -F":" '{print $1"\t"$2}' | awk '{print $1"\t"$2"_len\t"$4"\tcresil"}' > c11.txt

grep "Largest contig"  /data/gpfs-1/users/giurgium_c/scratch/sim_all/process/batch_*/sim_*/quast_true_cresil/report.txt | awk -F":" '{print $1"\t"$2}' | awk '{print $1"\t"$2"_contig\t"$4"\tcresil"}' > c12.txt

grep "Largest alignment"  /data/gpfs-1/users/giurgium_c/scratch/sim_all/process/batch_*/sim_*/quast_true_cresil/report.txt | awk -F":" '{print $1"\t"$2}' | awk '{print $1"\t"$2"_alignment\t"$4"\tcresil"}' > c19.txt


# Decoil 112

grep "Total length  "  /data/gpfs-1/users/giurgium_c/scratch/sim_all/process/batch_*/sim_*/quast_true_decoil_v112/report.txt | awk -F":" '{print $1"\t"$2}' | awk '{print $1"\t"$2"_len\t"$4"\tdecoil_112"}' > c13.txt

grep "auN "  /data/gpfs-1/users/giurgium_c/scratch/sim_all/process/batch_*/sim_*/quast_true_decoil_v112/report.txt | awk -F":" '{print $1"\t"$2}' | awk '{print $1"\t"$2"\t"$3"\tdecoil_112"}' > c14.txt

grep "Reference length"  /data/gpfs-1/users/giurgium_c/scratch/sim_all/process/batch_*/sim_*/quast_true_decoil_v112/report.txt | awk -F":" '{print $1"\t"$2}' | awk '{print $1"\t"$2"_len\t"$4"\tdecoil_112"}' > c15.txt

grep "Largest contig"  /data/gpfs-1/users/giurgium_c/scratch/sim_all/process/batch_*/sim_*/quast_true_decoil_v112/report.txt | awk -F":" '{print $1"\t"$2}' | awk '{print $1"\t"$2"_contig\t"$4"\tdecoil_112"}' > c16.txt

grep "Largest alignment"  /data/gpfs-1/users/giurgium_c/scratch/sim_all/process/batch_*/sim_*/quast_true_decoil_v112/report.txt | awk -F":" '{print $1"\t"$2}' | awk '{print $1"\t"$2"_alignment\t"$4"\tdecoil_112"}' > c20.txt


echo -e "batch\tsim\ttotal_len\tauN\tref_len\tmethod\tlongest_contig\tlongest_alignment" > collect_metrics.txt
paste c4.txt c5.txt c6.txt c8.txt | cut -f 1,3,5,7,9,11,12,15 | awk -F"\t" '$1 ~ $3 && $3 ~ $5 {print $1"\t"$2"\t"$4"\t"$6"\t"$7"\t"$8"\t0"}' | awk -F"[\/\t]" '{print $9"\t"$10"\t"$13"\t"$14"\t"$15"\t"$16"\t"$17"\t"$18}' >> collect_metrics.txt
paste c9.txt c10.txt c11.txt c12.txt c19.txt | cut -f 1,3,5,7,9,11,12,15,17,19 | awk -F"\t" '$1 ~ $3 && $3 ~ $5 && $5 ~ $9 {print $1"\t"$2"\t"$4"\t"$6"\t"$7"\t"$8"\t"$10}' | awk -F"[\/\t]" '{print $9"\t"$10"\t"$13"\t"$14"\t"$15"\t"$16"\t"$17"\t"$18}' >> collect_metrics.txt
paste c13.txt c14.txt c15.txt c16.txt c20.txt | cut -f 1,3,5,7,9,11,12,15,17,19 | awk -F"\t" '$1 ~ $3 && $3 ~ $5 && $5 ~ $9 {print $1"\t"$2"\t"$4"\t"$6"\t"$7"\t"$8"\t"$10}' | awk -F"[\/\t]" '{print $9"\t"$10"\t"$13"\t"$14"\t"$15"\t"$16"\t"$17"\t"$18}' >> collect_metrics.txt

rm c4.txt c5.txt c6.txt c8.txt c9.txt c10.txt c11.txt c12.txt c13.txt c14.txt c15.txt c16.txt c18.txt c19.txt c20.txt
