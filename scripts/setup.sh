## Update Packages
sudo dnf update

## WIFI Drivers
sudo dnf install iwlwifi-mvm-firmware iwlwifi-dvm-firmware NetworkManager-tui

## Extend XFS File System
sudo xfs_growfs /dev/mapper/fedora-root
sudo lvextend --extents +100%FREE /dev/mapper/fedora-root

## Extra Repositories
sudo dnf config-manager addrepo --from-repofile=https://repo.librewolf.net/librewolf.repo
sudo dnf copr enable alternateved/keyd
sudo dnf copr enable lihaohong/yazi
sudo dnf copr enable atim/starship
sudo dnf install https://download.onlyoffice.com/repo/centos/main/noarch/onlyoffice-repo.noarch.rpm
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

## Install DNF Packages
./packages.sh

## Enable/Disable Services
sudo systemctl enable ly@tty2.service
sudo systemctl disable getty@tty2.service
sudo systemctl enably keyd.service
sudo cp ~/home-manager/hmconfigs/keyd/keyd/default.conf /etc/keyd

## Install/Setup Home-Manager
sudo nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
sudo nix-channel update
sudo nix-shell '<home-manager>' -A install
rm -r ~/.config/home-manager/
mv ~/home-manager ~/.config
sudo systemctl enable nix-daemon
sudo systemctl start nix-daemon
home-manager switch

## Set Shell to ZSH
chsh -s /usr/bin/zsh
