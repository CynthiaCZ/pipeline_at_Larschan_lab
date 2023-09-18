# This script separates bed files in 1_files_to_separate.csv by chromosome X and autosomes using grep.
# INPUT: 2 out of 3 consensus peaks bed files outputted from 5_consensus_peaks_2_of_3_macs2.sh.
# OUTPUT: each bed file from the input is outputted as two files, chrX.bed and autosomes.bed

dir=/path/to/consensus/peaks/files

while IFS=$"," read -r bed_file
do
    bed_name=`echo ${bed_file} | cut -d '.' -f 1`
    echo "Processing bed file: ${bed_file}..."
    
    grep -P "chrX\t" ${dir}/${bed_file} > ${dir}/${bed_name}.chrX.bed
    grep "chr2" ${dir}/${bed_file} >> ${dir}/${bed_name}.autosomes.bed
    grep "chr3" ${dir}/${bed_file} >> ${dir}/${bed_name}.autosomes.bed
    grep "chr4" ${dir}/${bed_file} >> ${dir}/${bed_name}.autosomes.bed

done < ${dir}/"1_files_to_separate.csv"

echo "Done!"
