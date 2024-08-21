#!/bin/bash

# This script will install zsh and oh-my-zsh and set this as the default

dnf install -y curl git zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
chsh -s /bin/zsh
