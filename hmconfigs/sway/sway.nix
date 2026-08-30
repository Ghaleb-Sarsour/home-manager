{ config, pkgs, ...}:

{
	# home.file.".config/sway/config".source = ./swayconfigs/sway;	
	home.file.".config/swayidle/config".source = ./swayconfigs/swayidle;
	home.file.".config/swaylock/config".source = ./swayconfigs/swaylock;
}

