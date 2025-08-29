{ config, pkgs, ...}:

{
  programs = {
    wezterm.enable = true;
    neovim.enable = true;
    librewolf.enable = true;
    yazi.enable = true;
    tofi.enable = true;
    hyprpanel.enable = true;
    fzf.enable = true;
    starship.enable = true;
    neovide.enable = true;
  };
  services = {
    hyprpaper.enable = true;
  };
}
