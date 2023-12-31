#!/bin/bash
#SBATCH -p medium
#SBATCH -C scratch
#SBATCH -c 20
#SBATCH -N 1
#SBATCH --mem=30G
#SBATCH -t 00:30:00
#SBATCH -o job-%J.out
#SBATCH --mail-type=BEGIN,END
#SBATCH --mail-user=YOUR_EMAIL_ADDRESS@uni-goettingen.de

python $HOME/OrthoFinder/orthofinder.py -t 50 -a 6 -y -n run_2 -ft PATH_TO_THE_PREVIOUS_RUN/orthofinder/raw_prot_seqs/primary_transcripts/OrthoFinder/Results_run_1 -s SpeciesTree_input.txt  &> orthofinder_run2.log
