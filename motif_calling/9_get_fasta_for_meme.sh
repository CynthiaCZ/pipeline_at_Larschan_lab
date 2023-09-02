dir=/Users/zhangchengyue/Desktop/CnR/
bed_dir=/Users/zhangchengyue/Desktop/CnR/DiffBind/macs2

while IFS=$"," read -r line
do
    # echo "Constructing FASTA for Sample '${line}'..."
    name=`echo ${line} | cut -d '.' -f 1,2`
    echo "Constructing FASTA for Sample'${name}'"

    bedtools getfasta -fi ${dir}/dm6.fa \
        -bed ${bed_dir}/tsv_files/${line} \
        -fo ${bed_dir}/fasta_files/${name}.fa.out

done < ${bed_dir}/tsv_files/"1_files_clean.csv"

echo "Done!"