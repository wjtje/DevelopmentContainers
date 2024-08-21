#!/bin/zsh

# This will install Node-Version-Manager and the latest LTS version of NodeJS

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.0/install.sh | bash
source ~/.zshrc
nvm install --lts
