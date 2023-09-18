# This file loops over fasta files specified by 1_files_to_meme.csv
# and uses MEME to find the top 100 reoccurring motifs 
# INPUT: 2 out of 3 consensus peaks separated by X chromosome and autosome in fasta format 
# (output from 9.2_get_fasta_for_meme.sh)
# OUTPUT: a folder for each fasta file created by MEME

# Tools and versions: meme/5.0.5

fasta_dir=/path/to/fasta/files
out_dir=/path/to/meme/output

while IFS=$"," read -r file
do
    name=`echo ${file} | cut -d '.' -f 1,2`
    echo "Collecting MEME motifs for Sample'${name}'"

    meme ${fasta_dir}/${file} \
        -dna \
        -oc ${dir}/${name} \
        -nostatus \
        -time 14400 \
        -mod zoops \
        -nmotifs 100 \
        -minw 6 -maxw 50 \
        -objfun classic \
        -revcomp \
        -markov_order 0 \
        -p 32

done < ${fasta_dir}/"1_files_to_meme.csv"

echo "Done!"