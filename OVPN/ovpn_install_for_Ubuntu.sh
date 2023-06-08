#!/bin/bash

# This script will install OpenVPN client on to an Ubuntu / Debian system.

# Change the DISTRO variable to match your Ubuntu version
# Debian 9 = stretch
# Debian 10 = buster
# Ubuntu 16.04 = xenial
# Ubuntu 18.04 = bionic
# Ubuntu 20.04 = focal
# Ubuntu 20.10 = groovy
# Ubuntu 21.04 = hirsute 
# Ubuntu 22.04 = jammy 

DISTRO=jammy

echo "### installing apt-transport-https..."
sudo apt install apt-transport-https
echo "### downloading openvpn-reop-pkg-key.pub..."
sudo wget https://swupdate.openvpn.net/repos/openvpn-repo-pkg-key.pub
echo "### adding key to apt..."
sudo apt-key add openvpn-repo-pkg-key.pub
echo "### downloading installer list apt-transport-https..."
sudo wget -O /etc/apt/sources.list.d/openvpn3.list https://swupdate.openvpn.net/community/openvpn3/repos/openvpn3-$DISTRO.list
echo "### updating apt list..."
sudo apt update
echo "### installing openvpn3..."
sudo apt install openvpn3
echo "Done"
