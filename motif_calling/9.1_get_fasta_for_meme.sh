# This file converts bed files to fasta files for meme suite input
# INPUT: 2 out of 3 consensus peaks separated by X chromosome and autosome 
# (output from 9.1_separate_X.sh)
# OUTPUT: fasta files 

# Tools and versions: bedtools/2.26.0

genome_dir=/path/to/genome/files
bed_dir=/path/to/consensus/peaks/files
out_dir=/path/to/fasta/files

while IFS=$"," read -r file
do
    name=`echo ${file} | cut -d '.' -f 1,2`
    echo "Constructing FASTA for Sample'${name}'"

    bedtools getfasta -fi ${dir}/dm6.fa \
        -bed ${bed_dir}/${file} \
        -fo ${out_dir}/${name}.fa.out

done < ${bed_dir}/"1_files_to_fasta.csv"

echo "Done!"