{ config, pkgs, ... }:

{
  home.username = "ext4";
  home.homeDirectory = "/home/ext4";

  home.stateVersion = "25.05"; # Please read the comment before changing.

  imports  = [
    ./packages.nix
    ./hmconfigs/shell/sh.nix
    ./hmconfigs/neovim/neovim.nix
    ./hmconfigs/hyprland/hyprland.nix
    ./hmconfigs/wezterm/wezterm.nix
    ./hmconfigs/starship/starship.nix
    ./hmconfigs/yazi/yazi.nix
    ./hmconfigs/hyprpanel/hyprpanel.nix
    ./hmconfigs/tofi/tofi.nix
    ./hmconfigs/librewolf/librewolf.nix
    ./hmconfigs/icons/icons.nix
    ./hmconfigs/themes/themes.nix
    ./hmconfigs/fonts/fonts.nix
    ./hmconfigs/keyd/keyd.nix
  ];
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/ext4/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  programs.home-manager.enable = true;
}
