#!/bin/bash
# checked out from test branch
# bash script to install additional tools regularily needed for new ubuntu installs or VM's

# installs visual studio code
sudo apt update -y
sudo apt install software-properties-common apt-transport-https wget
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt update -y
sudo apt install code -y
# install vim
sudo apt install vim -y
# installs google chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install ./google-chrome-stable_current_amd64.deb
# clean-up google chrome
rm ./google-chrome-stable_current_amd64.deb
# install git & gitk & git-gui
sudo apt install git -y
sudo apt install gitk -y
sudo apt install git-gui -y
# installing terminator terminal
sudo apt install terminator -y
# installing zoom
sudo apt install ./zoom_amd64.deb -y

#Adding additional comment for version testing
