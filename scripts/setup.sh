# FOR SCREENSHARING 
#Check Sway Configuration
#Open your Sway configuration file, typically located at ~/.config/sway/config, and ensure it includes the necessary environment variables. You may need to add the following lines:

#include /etc/sway/config.d/*

#Systemd User Environment
#In the drop-in file located at /etc/sway/config.d/50-systemd-user.conf, ensure the following lines are present:

#exec systemctl --user import-environment DISPLAY WAYLAND_DISPLAY SWAYSOCK XDG_CURRENT_DESKTOP
#exec hash dbus-update-activation-environment 2>/dev/null && \
#dbus-update-activation-environment --systemd DISPLAY WAYLAND_DISPLAY SWAYSOCK XDG_CURRENT_DESKTOP XDG_CURRENT_DESKTOP=sway

#echo "XDG_RUNTIME_DIR=$XDG_RUNTIME_DIR"
#echo "WAYLAND_DISPLAY=$WAYLAND_DISPLAY"
#echo "XDG_CURRENT_DESKTOP=$XDG_CURRENT_DESKTOP"
#echo "XDG_SESSION_TYPE=$XDG_SESSION_TYPE"

#systemctl --user edit xdg-desktop-portal.service
# [Service]
# Environment=XDG_RUNTIME_DIR=/run/user/%U
# Environment=WAYLAND_DISPLAY=wayland-1
# Environment=XDG_SESSION_TYPE=wayland
# Environment=XDG_CURRENT_DESKTOP=wlroots
#
# systemctl --user daemon-reload
# systemctl --user restart xdg-desktop-portal.service
# systemctl --user status xdg-desktop-portal.service -l
# journalctl --user -u xdg-desktop-portal.service --since "1 min ago" --no-pager




# FOR CPUPOWER
# https://www.reddit.com/r/Fedora/comments/pr6w7j/note_fedora_cpu_frequency_scaling_using_cpupower/
#  Edit the grub configuration.
# vim /etc/default/grub
# Add the following configuration.
# GRUB_CMDLINE_LINUX_DEFAULT="intel_pstate=disable"
# Regenerate your grub.
# sudo grub2-mkconfig -o /boot/grub2/grub.cfg


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
sudo systemctl enable keyd.service
sudo systemctl enable cpupower.service
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
