#!/bin/bash

# Author: Phong stupid
# Date created: 2/6/2024
# Last modified: 2/6/2024

#Description
#To create backup file for staff in my company

#Usage
#Step 1: Open terminal
#Step 2: coppy and paste command in the terminal, then enter: export PATH="$PATH:$HOME/work/Bash_scripting_learning/v2_project_backup_script"
#Step 3: run command: source .profile
#Step 2: type this command in terminal: main_bash, then enter

#the middle of script
echo "Hello, ${USER^}"
echo "I will now back up your home directory, ${HOME}"
current_dir=$(pwd)
echo "You are running this script from ${current_dir}"
echo "Therefore, I will save the backup in ${current_dir}"
tar -cf ${current_dir}/my_backup_"$(date +%d-%m-%Y_%H-%M-%S)".tar $HOME/Desktop/* 2>/dev/null
echo "Backup Completed Successfully"
#end of script
exit 0