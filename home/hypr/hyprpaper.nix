{ config, lib, pkgs, ... }:

{
  # Create the fastfetch config file if it doesn't exist
  home.file.".config/hypr/hyprpaper.conf".text = ''

preload = /home/costeer/Pictures/Backdrops/keyNoHoles.png
wallpaper = , /home/costeer/Pictures/Backdrops/keyNoHoles.png

  '';
  }
