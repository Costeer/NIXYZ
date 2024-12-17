{ config, pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
  #----------------------Programs------------------------------------#
    
    
    #gnome-bluetooth
    #libgtop
    #bluez
    #bluez-tools
    #grimblast
    #gpu-screen-recorder
    #hyprpicker
    #networkmanager
    #matugen
    #wl-clipboard
    #swww
    #dart-sass
    #brightnessctl

    #r2modman
    appimage-run
    #inputs.umu.packages.${pkgs.system}.umu

    #---Terminal-Stuff---#
    gptfdisk
    neovim 
    cpio
    meson
    #python2
    cmake
    eza
    zoxide
    wget
    git
    asciiquarium-transparent
    protontricks
    cmatrix
    unzip
    btop
    playerctl
    zenith-nvidia
    nodejs_22
    #-Fetch-Scripts
    microfetch
    nitch
    maxfetch
    fastfetch
    nerdfetch
    afetch
    #---Customization---#
    bibata-cursors
    bibata-cursors-translucent
    hyprpaper
    nwg-look
    adw-gtk3
    gnome-extension-manager
    gnome-themes-extra
    gnome-tweaks
    colloid-icon-theme
    sassc
    gtk-engine-murrine
    gdm-settings
    dunst
    rofi-wayland
    wlogout
    papirus-icon-theme
    papirus-folders
    spicetify-cli
    egl-wayland
    
    #---Applications---#
    flatpak
    gearlever
    unityhub
    gamescope
    hyprshot
    gamescope
    obs-studio
    hyprpicker
    mangohud
    kitty
    alacritty
    obsidian
    krita
    aseprite
    ungoogled-chromium
    vlc
    #blender
    fragments
    spotify
  ];

 #-P.T.N.E.---------------------Programs-That-Need-Enabeling------------------------------------#

  programs.firefox.enable = true;
  # Zsh  
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  ###---Steam-n'-Stuff---###
  
  programs.steam = {
     enable = true;
     remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
     dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
  };
  
  programs.steam.gamescopeSession.enable = true;
  programs.gamemode.enable = true;

  ###---Hyperland---### 
  
  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  programs.hyprland = {
    enable = true;
    # set the flake package
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    # make sure to also set the portal package, so that they are in sync
    portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
  };

  programs.spicetify =
     let
       spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
     in
     {
       enable = true;
       enabledExtensions = with spicePkgs.extensions; [
         adblock
         hidePodcasts
         shuffle # shuffle+ (special characters are sanitized out of extension names)
       ];
       theme = spicePkgs.themes.default;
     };

  #----------------------------------------------------------------------------------------------#  
}
