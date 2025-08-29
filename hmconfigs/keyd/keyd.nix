{ config, pkgs, ...}:

{
  home.file."/etc/keyd/".source = ./keyd;
}
