#!/usr/bin/env bash

# Install Homebrew
if ! [ -x "$(command -v brew)" ]; then
    echo "Installing Homebrew ..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
else
    echo "Homebrew installed, updating instead ..."
    brew update
    brew outdated
    brew upgrade
fi

# Install git
brew install git
# Set up git
echo "Setting up git"
git config --global commit.gpgsign false
git config --global user.name "BinayaK Dasgupta"
git config --global user.email "binayakd86@gmail.com"

# Install latest latest bash
brew install bash
brew install bash-completion2

# Switch to new bash
if fgrep -p "/usr/local/bin/bash" /etc/shells; then
    echo "New bash shell already added in login shells ... "
else
    echo "Adding new bash shell to login shells and setting as default ... "
    echo "/usr/local/bin/bash" | sudo tee -a /etc/shells;
    chsh -s /usr/local/bin/bash
fi

# Install kubectl
echo "Installing kubectl, kubens, kubectx and kube-ps1 ..."
brew install kubectl
brew install kubectx
brew install kube-ps1

# Set up dotfiles
echo "Installing dotfiles ..."
bash -c ./bootstrap.sh
source ~/.bash_profile