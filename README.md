# Directory structure
```text
LUMI-EXAMPLE/
├── init_env/
│   ├── env_update.sh
│   ├── env.yaml
│   ├── step0_set_env_var.sh
│   ├── step1_create_env.sh
│   └── step2_install_gdal.sh
├── load_gdal.sh
├── README.md
├── run_job.sh
└── submit_job.sh
```


# Get access to LUMI
## Step1. Get a user account
## Step2. Setup SSH key pair
1. On local device, run
    ```bash
    ssh_key_file=${HOME}/.ssh/id_ed25519_lumi
    ssh-keygen -t ed25519 -f ${ssh_key_file}
    ```
    You can set a passward or leave it empty

2. Copy the publick key
    ```bash
    pbcopy < "${ssh_key_file}.pub"
    ```
3. Go to [LUMI user profile](https://mms.myaccessid.org/profile/) and register the public key.

    To register your key, click on the Settings item of the menu on the left as shown in the figure below. Then select SSH keys and click the New key button. Paste the content of your public key file in the text area and click the Add SSH key button.

    ![image](https://docs.lumi-supercomputer.eu/assets/images/MyAccessID_ssh-key.png)

    After registering your SSH key, there can be a couple of hours delay until it is synchronized to LUMI and your account is created. 

4. Setup SSH config for LUMI <br>
   open `~/.ssh/config`, copy and paste the following
   ```bash
   Host lumi
    HostName lumi.csc.fi
    User xxx # TODO: change xxx to your user name, can be found in one of the email LUMI sent
    IdentityFile ~/.ssh/id_ed25519_lumi
   ```
5. Test the connection with `ssh lumi` on local terminal. It should work with the password you set when creating the SSH key pair.


# Create Python environment
[LUMI doc](https://docs.lumi-supercomputer.eu/software/installing/container-wrapper/)


SSH to LUMI
```
ssh lumi
```
Clone the example code 
```
git clone https://github.com/huizhml/lumi-example.git
```

## New env

```bash
bash step0_set_env_var.sh
bash step1_create_env.sh
```
Remember to fill in your project number in `step0_set_env_var.sh` and `step1_create_env.sh`

## Update env
1. Load modules
	```bash
	module load LUMI
	module load lumi-container-wrapper
    ```
2. update
    ```bash
    conda-containerize update your_env_prefix --post-install update.sh
    ```
    your_env_path is defined by ENV_PREFIX in `step1_create_env.sh`.

    in ./update.sh, you can install Python libraries vis pip install or conda install
    ```bash
    pip install ...
    conda install ...
    ```

## Install GDAL
GDAL - [doc](https://lumi-supercomputer.github.io/LUMI-EasyBuild-docs/g/GDAL/)

```bash
bash init_env/step2_install_gdal.sh
```
If you want to install a difference version, check this [page](https://lumi-supercomputer.github.io/LUMI-EasyBuild-docs/g/GDAL/#user-installable-modules-and-easyconfigs) and update the GDAL version and corresponding LUMI version in `init_env/step2_install_gdal.sh`.

# Run jobs
## Iteractive bash terminal
```bash
srun -A project_{your_project_number} -p small --pty -t 8:00:00 --mem 64G --cpus-per-task 16 bash
```

## Submit a job
Before you submit a job,
- check if you have enough resource:
  - CPU/GPU/storage hours
  - large enough sapce, number of files
- configure your job correctly, you probably want to check
  - --partition
  - --time
  - --output (the parent folder must exist)
  - --mem

Example
```bash
sbatch submit_job.sh
```
