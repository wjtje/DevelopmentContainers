#!/bin/bash

# This script will run all the bash scripts in a folder
# All scripts should be named in the following format "00-name.sh"
# 
# The number indicates the priority of the script, the lower the earler it
# will be executes
# The name is a short descripts of what the script does. e.g. zsh or vscode
# 
# Each script should only do one thing

for f in /setup/*.sh; do
    # Ignore this script
    if ! [[ "$f" = *"00-setup.sh" ]]; then
        bash "$f"
    fi
done

# Cleanup
rm -rf /setup
dnf autoremove -y
