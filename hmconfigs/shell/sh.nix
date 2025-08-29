{ config, pkgs, ... }:

let
  aliases = {
    nix-clean = "sudo nix-collect-garbage -d && sudo nix-store --optimise -v && ncdu";
    usb-connect = "sudo systemctl restart usbguard.service";
    low-power = "sudo tlp bat";
    high-power = "sudo tlp ac";
  };

in
{
  home.sessionPath = [
    "/home/ext4/.cargo/bin"
    "/home/ext4/.local/bin"
  ];
  programs.zsh = {
    enable = true;
    shellAliases = aliases;
    initExtra = ''
      #make nvim default editor
      export EDITOR=nvim

      # Enable programs
      eval "$(starship init zsh)"
      eval "$(fzf --zsh)" 

      # History Keybinds
      bindkey "''${key[Up]}" history-substring-search-up
      bindkey "''${key[Down]}" history-substring-search-down

      # Run root
      xhost si:localuser:root
      . /home/ext4/.nix-profile/etc/profile.d/nix.sh    
    '';

    plugins = [
      { 
        name = "zsh-autosuggestions"; 
        src = pkgs.fetchFromGitHub {
          owner = "zsh-users";
          repo = "zsh-autosuggestions";
          tag = "v0.7.1";
          sha256 = "vpTyYq9ZgfgdDsWzjxVAE7FZH4MALMNZIFyEOBLm5Qo=";
        };
      }
      { 
        name = "zsh-history-substring-search";
        src = pkgs.fetchFromGitHub {
          owner = "zsh-users";
          repo = "zsh-history-substring-search";
          tag = "v1.1.0";
          sha256 = "GSEvgvgWi1rrsgikTzDXokHTROoyPRlU0FVpAoEmXG4=";
        };
      }
      {
        name = "zsh-syntax-highlighting";
        src = pkgs.fetchFromGitHub {
          owner = "zsh-users";
          repo = "zsh-syntax-highlighting";
          tag = "0.8.0";
          sha256 = "iJdWopZwHpSyYl5/FQXEW7gl/SrKaYDEtTH9cGP7iPo=";
        };
      }
    ]; 

  };

  programs.bash = {
    enable = true;
    shellAliases = aliases;
  };

}
