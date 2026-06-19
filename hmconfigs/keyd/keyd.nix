{ config, pkgs, ...}:

{
  home.file.".config/keyd/".source = ./keyd;
}
