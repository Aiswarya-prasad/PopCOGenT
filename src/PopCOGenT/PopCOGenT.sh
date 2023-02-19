#!/bin/bash

working_dir=.
config_file=./config.sh
output_dir=.

print_usage() {
  echo "Usage: bash PopCOGenT.sh -c <full path to config file> -w <directory to work in>"
}

while getopts 'w:c:h' flag; do
  case "${flag}" in
    w) working_dir=$OPTARG ;;
    c) config_file=$OPTARG ;;
    o) output_dir=$OPTARG ;;
    h) print_usage
       exit 1 ;;
  esac
done
echo "getting parameters from $config_file"
echo "..."
source ${config_file}
echo "Working set to: $working_dir"
cd $working_dir
# source activate PopCOGenT
# source ${mugsy_env}

if [ ! -f ${final_output_dir}/${base_name}.length_bias.txt ]
	then
		python get_alignment_and_length_bias.py --genome_dir ${genome_dir} --genome_ext ${genome_ext} --alignment_dir ${alignment_dir} --mugsy_path ${mugsy_path} --mugsy_env ${mugsy_env} --base_name ${base_name} --final_output_dir ${final_output_dir} --num_threads ${num_threads} ${keep_alignments}
fi
python cluster.py --base_name ${base_name} --length_bias_file ${final_output_dir}/${base_name}.length_bias.txt --output_directory ${final_output_dir} --infomap_path ${infomap_path} ${single_cell}
cp infomap_out/* $output_dir
