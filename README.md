# SRA_download
Script to download a list of runs from SRA. Pipeline for HPC with SLURM scheduler

## Requirements
The script requires to have SRA-toolkit installed on your system. On CSC Puhti, the toolkit is available through the module biokit and does not need to be installed. 
If you need to install SRA-toolkit, follow the instructions here: https://github.com/ncbi/sra-tools/wiki/02.-Installing-SRA-Toolkit

## Running the script

### Define the list of runs to download
Once the github repo is clone on your machine, navigate inside the folder to edit the sra_list.txt with the list of SRA runs to download.

### Submit the job
Edit the script SBATCH header for more or less download time according to the number of ID to download.

Submit the job:
```
sbatch download_SRA.sh
```

### Verify download
The script will create a folder called "files_downloaded" containing the fastq files downloaded from SRA.
