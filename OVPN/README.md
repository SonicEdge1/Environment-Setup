[OpenVPN-Linux-install-reference-page](https://community.openvpn.net/openvpn/wiki/OpenVPN3Linux)
# Setting up and Using Open VPN

## Included Files:
* ovpn_install_for_Ubuntu.sh - Installs the open vpn client on an Ubuntu OS
* import_config_file.sh - Imports the config file for persistent future use as a config profile
* connect.sh - Connects to the VPN using the stored configuration profile
* disconnect.sh - Disconnects from the VPN using the stored config profile
* Controlling the VPN from POP_OS menu.odt

## Instructions:
All script files need to be modified in order to work properly.
The instructions found in `Controlling the VPN from POP_OS menu.odt` should only be followed AFTER completing the steps in `ovpn_install_for_Ubuntu.sh` and `import_config_file.sh`

### ovpn_install_for_Ubuntu.sh
* the command `apt-key add openvpn-repo-pkg-key.pub` is deprecated. `curl -fsSL https://swupdate.openvpn.net/community/openvpn3/repos/openvpn3-$DISTRO.list >/etc/apt/sources.list.d/openvpn3.list` is now the proper command to use but I has to be logged in as su to use it.  Sudo did not work.  Until script is fixed, commands need to be run one at a time.
* The DISTRO variable needs changed to appropriately match your version of Ubuntu (see instructions in file
)

### import_config_file.sh
* The OVPN_FILE variable needs to be changed to the location/file.ovpn that was sent to you by the system admin.


### connect.sh
* The PROFILE_NAME variable needs to be changed to the name of the VPN profile you want to use.  
If you have run the import script, you can find your profile name by typing:  
`openvpn3 configs-list`  
Your configuration profile name it will be the entire last returned line

### disconnect.sh
* The PROFILE_NAME variable needs to be changed to the name of the VPN profile you want to disconnect from.

## Sources:
* https://community.openvpn.net/openvpn/wiki/OpenVPN3Linux
* https://openvpn.net/cloud-docs/openvpn-3-client-for-linux/
* https://openvpn.net/vpn-server-resources/connecting-to-access-server-with-linux/
