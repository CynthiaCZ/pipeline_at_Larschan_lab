#!/bin/bash
#SBATCH -J homer
#SBATCH -n 32
#SBATCH -t 24:00:00
#SBATCH --mem=32G
#SBATCH -o /users/czhang91/CnR_2023/logs/homer-%A.out
#SBATCH -e /users/czhang91/CnR_2023/logs/homer-%A.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=chengyue_zhang@brown.edu

module load homer/4.10

bed_dir=/users/czhang91/CnR_2023/consensus_peaks/consensus_peaks_2_of_3/XvsA
genome_dir=/users/czhang91/CnR_2023/genome
out_dir=/users/czhang91/CnR_2023/homer_results

while IFS=$"," read -r bed_file
do
    name=`echo ${bed_file} | cut -d '.' -f 1,2`
    echo "Processing bed file: ${name}..."
    
    findMotifsGenome.pl ${bed_dir}/${bed_file} ${genome_dir}/dm6.fa ${out_dir}/${name} -S 100 -p 31
    
done < ${bed_dir}/"1_files.csv"

echo "Done!"
