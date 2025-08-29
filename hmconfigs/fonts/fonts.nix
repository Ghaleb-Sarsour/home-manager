{ config, pkgs, ...}:

{
  home.file.".local/share/fonts".source = ./font_folder;
}
