# How to use Orthofinder on the HPC (GWDG) 

## Setup
I prefer to set up the environment via conda. First, load the anaconda module:
```
module load anaconda3/2021.05
```
Then, you can create a conda environment with a desired name and install dependencies:
```
conda create -n orthofinder_env -c conda-forge -c bioconda python numpy scipy diamond mmseqs2 mcl fastme mafft fasttree blast muscle iqtree raxml raxml-ng
```
Feel free to omit some dependecies to save storage space if you are not going to use them. For example, I only use this one:
```
conda create -n orthofinder_env -c conda-forge -c bioconda python numpy scipy diamond mcl fastme mafft fasttree
```
Then, you have to activate your environment (do not forget that it is an arbitrary name that we used`orthofinder_env`):
```
conda activate orthofinder_env
```
Now, download the latest Orthofinder (the branch you like) using git. Save it in a path you like:
```
git clone https://github.com/davidemms/OrthoFinder.git
```
I highly suggest to clean your input fasta files. Basically, remove anything that is unnecessary and keep only transcript IDs and gene IDs like this:
```
>TranscriptID gene=GeneID
```
It is relatively easy to do it via regex.
According to the authors tutuorial, we have to have only one transcript per gene (primary transcript). They offered a python code to do that for you, if you clean your fasta file as I mentioned above.
Let's assume you are in a folder with all of your fasta input files that are preprocessed and the extension for all of them is `.fa`. Let's assume you downloaded the Orthofinder in your home folder (you can change the command the way you like). Then:
```
for f in *fa ; do python $HOME/OrthoFinder/tools/primary_transcript.py $f ; done
```
This, creates a new folder in your working directory with only primary transcripts called `primary_transcripts`.

Now, you can use orthofinder to perform the analysis you like. I included two different bash file in this repository. In run_1, I just use most default values and specified the number of active threads, cpu, ... according to the [Orthofinder manual](https://github.com/davidemms/OrthoFinder). In run_2, I used the results in run_1 and used a user-specified rooted species tree. This are just some examples and you can adjust your command the way you like.

Finally, you can submit your job (here, orthofinder.sh is my bash file) using Slurm via:
```
sbatch orthofinder.sh
``` 
It took around 410 minutes for 26 species I specified in the species tree with the setting I mentioned in the bash file.
