# This file loops over fasta files specified by 1_files_to_streme.csv
# and uses STREME to find the top 100 reoccurring motifs 
# INPUT: 2 out of 3 consensus peaks separated by X chromosome and autosome in fasta format 
# (output from 9.2_get_fasta_for_meme.sh)
# OUTPUT: a folder for each fasta file created by STREME

# Tools and versions: Docker/24.0.5, memesuite/5.5.4

fasta_dir=/path/to/fasta/files
out_dir=/path/to/streme/output

while IFS=$"," read -r file
do
    name=`echo ${file} | cut -d '.' -f 1`
    echo "Processing fasta file: ${name}..."

	docker run --cpus=8 --memory=10g --memory-swap=-1 \
    -v `pwd`:/home/meme --user `id -u`:`id -g` memesuite/memesuite streme \
    --verbosity 1 \
    --oc ${out_dir}/${name} \
    --dna --time 14400 --minw 8 --maxw 30 --thresh 0.05 \
    --align center --parse-genomic-coord --p ${fasta_dir}/${file} --nmotifs 100

done < ${fasta_dir}/"1_files_to_streme.csv"

