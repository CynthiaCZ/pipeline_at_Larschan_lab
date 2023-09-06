# This file contains a loop that uses MSPC to get consensus peaks from
# replicates whose names are specified by 1_files_to_mspc.csv.
# INPUT: narrowPeak files outputted from 4_macs2_call_peaks.sh.
# OUTPUT: consensus peaks bed files that are shared by 2 out of 3 replicates.

# Tools and versions: mspc/6.0.1

mspc_dir=/path/to/mspc
in_dir=/path/to/narrowpeaks/files
out_dir=/path/to/consensus/peaks/files

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
# -c 2 to include 2 samples
