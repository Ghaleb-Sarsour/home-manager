{ config, pkgs, ...}:

{
  programs = {
    wezterm.enable = true;
    yazi.enable = true;
    tofi.enable = true;
    hyprpanel.enable = true;
    fzf.enable = true;
    starship.enable = true;
    neovide.enable = true;
    fastfetch.enable = true;
    hyprshot.enable = true;
    qutebrowser.enable = true;
 };
	home.packages = with pkgs; [
		discordo
	]; 
}
