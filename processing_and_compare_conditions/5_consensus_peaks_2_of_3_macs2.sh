#!/bin/bash
#SBATCH -J mspc
#SBATCH -n 16
#SBATCH -t 24:00:00
#SBATCH --mem=32G
#SBATCH -o /users/czhang91/CnR_2023/logs/mspc-%A.out
#SBATCH -e /users/czhang91/CnR_2023/logs/mspc-%A.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=chengyue_zhang@brown.edu

mspc_dir=/users/czhang91/CnR_2023/mspc
in_dir=/users/czhang91/CnR_2023/macs2_peaks_NO_MERGE
out_dir=/users/czhang91/CnR_2023/consensus_peaks/consensus_peaks_2_of_3

while IFS=$"," read -r condition
do
    ${mspc_dir}/mspc -i ${in_dir}/${condition}*.narrowPeak \
        -d 16 \
        -r bio \
        -s 1E-8 \
        -w 1E-4 \
        -g 1E-8 \
        -c 2 \
        -a 0.05 \
        -m lowest \
        -o ${out_dir}/${condition}consensus_peaks

done < ${in_dir}/"1_files_to_mspc.csv"

echo "Done!"


# -c 2 indicates how many sample you want the peak to appear in