#!/bin/bash
#SBATCH -p medium
#SBATCH -C scratch
#SBATCH -c 20
#SBATCH -N 1
#SBATCH --mem=30G
#SBATCH -t 00:30:00
#SBATCH -o job-%J.out
#SBATCH --mail-type=BEGIN,END
#SBATCH --mail-user=armin.dadras@uni-goettingen.de

python /usr/users/dadras/bin/OrthoFinder/orthofinder.py -t 50 -a 6 -y -n run_2 -ft /scratch/users/dadras/taja/orthofinder/raw_prot_seqs/primary_transcripts/OrthoFinder/Results_run_1 -s SpeciesTree_input.txt  &> orthofinder_run2.log
