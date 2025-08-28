{ config, pkgs, ... }:

{
  # home.file.".config/nvim/".source = ./nconfig;
  home.file.".config/nvim".source = ./uconfig;
}
