# Helpful Files for an Debian / Ubuntu Setup

## Folders
### OVPN
- Folder containing scripts to install and use the OVPN client necessary to connect to the skicamp VPN

## Files
### certs.zip
- A zip file containing all DOD .crt files
### install-DA-Ubuntu-newer.sh
- Script file that downloads & installs certificates, dependencies, and the DesktopAnywhere Client
### README.md
- this file
### reset.sh
- utility script to run in case the install-DA-Ubuntu-newer.sh script fails.  Deletes downloads, folders, and symlinks to prevent a failure on a subsequent execution.
### setup_new_Ubuntu_machine.sh
- Script file that helps set up a new Ubuntu machine with basics like: 
  - curl
  - wget
  - vim
  - git, gitk, & git-gui
  - VS Code
  - Google Chrome
  - Virtual Machnine Manager
  - Terminator terminal emulator
  - Zoom Cloud Meetings
  - OpenVPN Client & gnome plug-in
  - flatpak applications
    - Mattermost Desktop
    - Signal Desktop
    - Microsoft Teams
  - A custom prompt when in a git repository 
- The script will ask the user if they want to install each item before its install.
### Updating_Chrome_with_gov_certs.odt
- A document that explains how to update the Chrome browser with the necessary permissions and certificates to visit CAC-enabled DOD websites / DOD webmail. In OpenDocument Text File format.
### Updating_Firefox_with_gov_certs.odt
- A document that explains how to update the Firefox browser with the necessary permissions, certificates, and card readers to visit CAC-enabled DOD websites / DOD webmail.  In OpenDocument Text File format.