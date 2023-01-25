#!/bin/bash

# bash script to install additional tools regularily needed for new ubuntu installs or VM's

# Function that allows user to choose each item to install
choose() {
    read -rp "[INFO] Would you like to install $1 ? [Y/n] ";
    if [[ $REPLY == [yY] ]]; then
        echo -e "\n[INFO] Installing $1..."
        $2
        echo ""
    else
        echo -e "\n[SKIP] Not installing $1.\n";
    fi
}

# updates system
update_system() {
    sudo apt update -y
    sudo apt upgrade -y
    echo "[INFO] System Update Completed."
}

# installs visual studio code
install_VS_Code() {
    sudo apt install software-properties-common apt-transport-https wget -y
    wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
    sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
    sudo apt update -y
    sudo apt install code -y
    echo "[INFO] VS Code installed."
}

# installs vim
install_vim() {
    sudo apt install vim -y
    echo "[INFO] Vim installed."
}

#installs curl
install_curl() {
    sudo apt install curl -y
    echo "[INFO] curl installed."
}

#installs wget
install_wget() {
    sudo apt install wget -y
    echo "[INFO] wget installed."
}

#installs virtual machine manager
install_virt_manager() {
    sudo apt install virt-manager -y
    echo "[INFO] virtual machine manager installed."
}

# installs google chrome
install_google_chrome() {
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    sudo apt install ./google-chrome-stable_current_amd64.deb
    # clean-up google chrome
    rm ./google-chrome-stable_current_amd64.deb
    echo "[INFO] google chrome installed."
}

# installs git & gitk & git-gui
install_git_suite() {
    sudo apt install git -y
    sudo apt install gitk -y
    sudo apt install git-gui -y
    echo "[INFO] git, gitk, and git-gui installed."
}

# installs terminator terminal
intstall_terminator() {
    sudo apt install terminator   -y
    echo "[INFO] terminator terminal emulator installed."
}

# installs Mattermost Desktop
install_mattermost_desktop() {
    sudo flatpak install flathub com.mattermost.Desktop -y
    echo "[INFO] Mattermost Desktop installed."
}

# installs Signal Desktop
install_signal_desktop() {
    sudo flatpak install flathub org.signal.Signal -y
    echo "[INFO] Signal Desktop installed."
}

# installs Microsoft Teams
install_microsoft_teams() {
    sudo flatpak install flathub com.microsoft.Teams -y
    echo "[INFO] Microsoft Teams installed."
}

# installs flatpak repo and apps
install_flatpak_repo() {
    sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    echo "[INFO] flatpak repo installed."
    choose "Mattermost Desktop via flatpak" install_mattermost_desktop
    choose "Signal Desktop via flatpak" install_signal_desktop
    choose "Microsoft Teams via flatpak" install_microsoft_teams
}

# installs zoom
install_zoom() {
    wget https://zoom.us/client/latest/zoom_amd64.deb
    sudo apt install ./zoom_amd64.deb -y
    echo "[INFO] Zoom installed."
}

# installs open VPN client
install_ovpn_client() {
    read -rp "[INFO] Are you running Ubuntu 20.04 ? [Y/n] ";
    if [[ $REPLY == [yY] ]]; then
        echo -e "\n[INFO] Excellent!"
        DISTRO=focal
        sudo apt install apt-transport-https
        sudo wget https://swupdate.openvpn.net/repos/openvpn-repo-pkg-key.pub
        sudo apt-key add openvpn-repo-pkg-key.pub
        sudo wget -O /etc/apt/sources.list.d/openvpn3.list https://swupdate.openvpn.net/community/openvpn3/repos/openvpn3-$DISTRO.list
        sudo apt update
        sudo apt install openvpn3
        sudo apt install network-manager-openvpn-gnome
        echo "[INFO] Open VPN installed."
    else
        echo -e "\n[SKIP] refer to https://community.openvpn.net/openvpn/wiki/OpenVPN3Linux for installation instructions for your version of Ubuntu.\n";
    fi
}

# adds git-prompt support to show current repo branch and status
install_git-prompt() {
        
    echo 'source ~/.git-prompt.sh # Show git branch name at command prompt' >> ~/.bashrc
    cat <<'EOT' >> ~/.bashrc

# GIT bash integration
if [[ -e /usr/lib/git-core/git-sh-prompt ]]; then 
    source /usr/lib/git-core/git-sh-prompt
    export GIT_PS1_SHOWCOLORHINTS=true
    export GIT_PS1_SHOWDIRTYSTATE=true
    export GIT_PS1_SHOWUNTRACKEDFILES=true
    export GIT_PS1_SHOWUPSTREAM="auto"

    # use existing PS1 settings
    PROMPT_COMMAND=$(sed -r 's|^(.+)(\\\$\s*)$|__git_ps1 "\1" "\2"|' <<< $PS1)
fi
EOT

source ~/.bashrc
echo "[INFO] git-promt installed. You must restart any open terminals to see changes take effect."
}

echo "This installer helps set up a new debian system with commonly used developer tools"
echo "You will be able to choose which tools / programs you would like to install."
echo ""
choose "/ perform system update" update_system
choose "curl" install_curl
choose "wget" install_wget
choose "Vim" install_vim
choose "git, gitk, and git-gui" install_git_suite
choose "VS Code" install_VS_Code
choose "Virtual Machine Manager" install_virt_manager
choose "Google Chrome" install_google_chrome
choose "Terminator terminal emulator https://terminator-gtk3.readthedocs.io/en/latest/" intstall_terminator
choose "Zoom Cloud Meetings" install_zoom
choose "OpenVPN Client" install_ovpn_client
choose "git-prompt https://github.com/git/git/blob/master/contrib/completion/git-prompt.sh" install_git-prompt
choose "any flatpak applications" install_flatpak_repo

echo -e "Thank you for using the SkiCAMP installer!\n"

#gimp and the svg one.
#
# postman
# https://dl.pstmn.io/download/latest/linux64
# **create .desktop entry in /usr/share/applications
#install intellij / ******************create desktop launcher(can do that from the intellij install in the options menu)
#https://download.jetbrains.com/idea/ideaIC-2022.2.tar.gz?_gl=1*17i5ryt*_ga*MTAzMDc1NDA4OS4xNjU5NjU2MDg4*_ga_9J976DJZ68*MTY1OTY1NjA4Ny4xLjEuMTY1OTY1NjEyNC4w&_ga=2.85439001.1276154212.1659656088-1030754089.1659656088

#install docker https://docs.docker.com/engine/install/ubuntu/
#remove any old versions:
#sudo apt-get remove docker docker-engine docker.io containerd runc

# Update the apt package index and install packages to allow apt to use a repository over HTTPS:
#  sudo apt-get update
#  sudo apt-get install \
#     ca-certificates \
#     curl \
#     gnupg \
#     lsb-release

# Add Docker official GPG key:
#  sudo mkdir -p /etc/apt/keyrings
#  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

# Use the following command to set up the repository:
#  echo \
#   "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
#   $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Install Docker
#  sudo apt-get update
#  sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin

#  Test Install
#   sudo docker run hello-world