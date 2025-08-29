sudo dnf update
sudo dnf copr enable solopasha/hyprland
sudo dnf copr enable heus-sueh/packages
sudo dnf copr enable alternateved/keyd
./dnf.sh
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
