sudo xfs_growfs /dev/mapper/fedora-root
sudo lvextend --extents +100%FREE /dev/mapper/fedora-root
sudo dnf update
sudo dnf copr enable solopasha/hyprland
sudo dnf copr enable heus-sueh/packages
sudo dnf copr enable alternateved/keyd
sudo dnf copr enable crashdummy/DisplayLink
sudo dnf install https://download.onlyoffice.com/repo/centos/main/noarch/onlyoffice-repo.noarch.rpm
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
./dnf.sh
./hints.sh
sudo systemctl enable tlp.service
curl -L https://nixos.org/nix/install | sh
. /home/ext4/nix-profile/etc/profile.d/nix.sh
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --add https://github.com/nix-community/nixGL/archive/main.tar.gz nixgl
nix-channel --update
nix-env -iA nixgl.auto.nixGLDefault
nix-shell '<home-manager>'-A install
rm ~/.config/home-manager/
mv ~/home-manager ~/.config
home-manager switch
chsh -s /usr/bin/zsh
