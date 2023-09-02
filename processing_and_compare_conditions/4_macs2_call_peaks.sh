#!/bin/bash
#SBATCH -J macs2_call_peaks
#SBATCH -n 16
#SBATCH -t 24:00:00
#SBATCH --mem=32G
#SBATCH -o logs/call_peaks-%A.out
#SBATCH -e logs/call_peaks-%A.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=chengyue_zhang@brown.edu


module load anaconda/2022.05
source /gpfs/runtime/opt/anaconda/2022.05/etc/profile.d/conda.sh
conda activate macs2

bam_dir=/users/czhang91/CnR_2023/bam_files_dedup_NO_MERGE
out_dir=/users/czhang91/CnR_2023/macs2_peaks_NO_MERGE

while IFS=$"," read -r bam_file
do
    bam_name=`echo ${bam_file} | cut -d '.' -f 1`
    echo "Processing BAM file: ${bam_file}..."
    
    macs2 callpeak -t ${bam_dir}/${bam_file}  \
        --nomodel --extsize 147 -g dm \
        -n ${bam_dir}/${bam_name} \
	    --outdir ${out_dir}

done < ${bam_dir}/"1_files_to_call_peaks.csv"

echo "Done!"
