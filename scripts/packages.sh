## DNF Packages to install
sudo dnf install fastfetch neovim sway kitty librewolf chromium openssl xhost nix zsh keyd cpupower onlyoffice-desktopeditors btop nextcloud obs steam tmux yazi starship discord blueman waybar flatpak docker

sudo dnf install mscore-fonts-all lm_sensors

## cpupower stuff
sudo dnf install acpi acpid acpitool kernel-tools

## Screensharing
sudo dnf install xdg-desktop-portal-wlr wlroots xdg-desktop-portal

## Audio
sudo dnf install pipewire wireplumber pavucontrol alsa-utils alsa-firmware alsa-sof-firmware

## Programming Languages
sudo dnf install cargo rust java javac go

## Ly and its Dependencies
sudo dnf install kernel-devel pam-devel libxcb-devel zig brightnessctl ly

## Delete Unneeded Programs 
sudo dnf remove foot

##Flatpak
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak install flathub com.github.ahrm.sioyek
