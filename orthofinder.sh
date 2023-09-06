#!/bin/bash
#SBATCH -p medium
#SBATCH -C scratch
#SBATCH -c 60
#SBATCH -N 1
#SBATCH --qos=long
#SBATCH --mem=90G
#SBATCH -t 5-00:00:00
#SBATCH -o job-%J.out
#SBATCH --mail-type=BEGIN,END
#SBATCH --mail-user=YOUR_EMAIL_ADDRESS@uni-goettingen.de

python $HOME/OrthoFinder/orthofinder.py -f PATH_TO_YOUR_FILES/raw_prot_seqs/primary_transcripts -S diamond -M msa -A mafft -T fasttree -t 50 -a 6 -y -n run_1 &> orthofinder_run1.log
