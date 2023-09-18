# This file loops over fasta files specified by 1_files_to_homer.csv
# and uses HOMER to find the top 100 reoccurring motifs 
# INPUT: 2 out of 3 consensus peaks separated by X chromosome and autosome
# (output from 9.1_separate_X.sh)
# OUTPUT: a folder for each fasta file created by HOMER

module load homer/4.10

bed_dir=/path/to/consensus/peaks/files
genome_dir=/path/to/genome/files
out_dir=/path/to/homer/output

while IFS=$"," read -r file
do
    name=`echo ${file} | cut -d '.' -f 1,2`
    echo "Processing bed file: ${name}..."
    
    findMotifsGenome.pl ${bed_dir}/${file} ${genome_dir}/dm6.fa ${out_dir}/${name} -S 100 -p 31
    
done < ${bed_dir}/"1_files.csv"

echo "Done!"
