#!/bin/bash --login
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --mem=4G
#SBATCH --time=08:00:00
#SBATCH --job-name=jupyter-notebook

# get tunneling info
node=$(hostname -s)
user=$(whoami)
port=8889

# print tunneling instructions jupyter-log
echo -e "
Command to create ssh tunnel:
ssh -N -f -L ${port}:${node}:${port} ${user}@jaguar1.eie.wits.ac.za

Use a Browser on your local machine to go to:
localhost:${port}  (prefix w/ https:// if using password)
"

# load modules or conda environments here
mamba env list
mamba activate africa_poverty_clean

# Run Jupyter
jupyter-notebook --notebook-dir=.. --no-browser --port=${port} --ip=0.0.0.0