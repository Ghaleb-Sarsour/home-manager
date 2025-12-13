{ config, pkgs, ... }:

{
  home.file.".config/nvim/init.lua".source = ./config/init.lua;
}
