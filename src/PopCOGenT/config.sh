# Base name for final output files ust a prefix to identify your outputs.
base_name='India_mags'

# Output directory for the final output files.
# This will create the directory if it does not already exist.
final_output_dir=/scratch/aprasad/211018_Medgenome_india_samples/11_popcogent/Output
mkdir -p ${final_output_dir}

# Path to mugsy and mugsyenv.sh. Please provide absolute path.
mugsy_path=$(which mugsy)
mugsy_env=${mugsy_path%%mugsy}mugsyenv.sh

# Path to infomap executable. Please provide absolute path.
infomap_path=$(which Infomap)

# Path to genome files.
genome_dir=/scratch/aprasad/211018_Medgenome_india_samples/11_popcogent/00_Genomes

# Genome file filename extension.
genome_ext=.fa

# Are you running on a single machine? Please specify the number of threads to run.
# This can, at maximum, be the number of logical cores your machine has.
num_threads=1

# Whether to keep alignments after length bias is calculated.
# Alignment files can be 10MB each and thus a run on 100 genomes can take up on the order of 50 GB of space if alignment files are not discarded.
# If you want to keep alignments, set to --keep_alignments. Otherwise leave as ''.
keep_alignments=--keep_alignments

# Directory for output alignments. Must provide absolute path.
alignment_dir=/scratch/aprasad/211018_Medgenome_india_samples/11_popcogent/proc/
mkdir -p ${alignment_dir}

# Are your genomes single-cell genomes? If so, this should equal --single_cell. Otherwise leave as ''.
single_cell=''

# Are you using a slurm environment? Then this should equal --slurm, otherwise, leave as empty quotes.
slurm_str=''

# If using slurm, please specify the output directory for the runscripts and source scripts. Absolute paths required.
script_dir=''
source_path=''
