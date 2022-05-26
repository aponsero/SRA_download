#!/bin/bash -l
#SBATCH --job-name=download_sra
#SBATCH --account=
#SBATCH --output=outputr%j.txt
#SBATCH --error=errors_%j.txt
#SBATCH --partition=small
#SBATCH --time=10:00:00
#SBATCH --ntasks=1
#SBATCH --nodes=1
#SBATCH --cpus-per-task=5
#SBATCH --mem-per-cpu=400



# load job configuration
cd $SLURM_SUBMIT_DIR
LIST="sra_list.txt"

# load environment
module load biokit
vdb-config -i

# echo for log
echo "job started - sra download"; hostname; date

# output dir to save the files
mkdir files_downloaded

while read -r sra_id
do
	cd files_downloaded
	prefetch $sra_id
	fastq-dump --split-files $sra_id
	cd ..
done<$LIST

# echo for log
echo "job finished;"; date


