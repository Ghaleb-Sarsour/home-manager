{ config, pkgs, ... }:

{
    home.file.".config/waybar/config".source = ./config;
}
