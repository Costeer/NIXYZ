# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, ... }:

{
  imports =
    [ 
    ./hardware-configuration.nix

    ###---Config-Splitting---###
    ./programs.nix
    
    ./modules/nix.nix 
    ./modules/nvidia.nix
    ./modules/appimage.nix
    ./modules/fonts.nix

    ###---Programs---###
    inputs.home-manager.nixosModules.default
    inputs.spicetify-nix.nixosModules.default
    
  
  ];   

  programs.nix-ld.enable = true;


  systemd.services.flatpak-repo = {
    wantedBy = [ "multi-user.target" ];
    path = [ pkgs.flatpak ];
    script = ''
      flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    '';
  };
  services = {
    flatpak.enable = true;
  };

  services.flatpak.update.onActivation = true;

  services.flatpak.packages = [
#    { appId = "com.brave.Browser"; origin = "flathub";  }
#    "com.obsproject.Studio"
#    "im.riot.Riot"

    { appId = "dev.vencord.Vesktop"; origin = "flathub";  }
    "com.obsproject.Studio"
    "im.riot.Riot"


    { appId = "io.github.zen_browser.zen"; origin = "flathub";  }

  ];

#  download-buffer-size = "128";

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Berlin";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "de_DE.UTF-8";
    LC_IDENTIFICATION = "de_DE.UTF-8";
    LC_MEASUREMENT = "de_DE.UTF-8";
    LC_MONETARY = "de_DE.UTF-8";
    LC_NAME = "de_DE.UTF-8";
    LC_NUMERIC = "de_DE.UTF-8";
    LC_PAPER = "de_DE.UTF-8";
    LC_TELEPHONE = "de_DE.UTF-8";
    LC_TIME = "de_DE.UTF-8";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "de";
    variant = "";
  };

  # Configure console keymap
  console.keyMap = "de";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.costeer = {
    isNormalUser = true;
    description = "costeer";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
    #  thunderbird
    ];
  };

  # Allow unfree packages
  #nixpkgs.config.allowUnfree = true;

  #-E.V.'.s.---------------------Enviroment-Variables--------------------------------------------#

  home-manager = {
    # also pass inputs to home-manager modules
    extraSpecialArgs = {inherit inputs;};
    users = {
      "costeer" = import ./home.nix;
    };
  };

  environment.sessionVariables = {
    #If your cursor becomes invisible
    no_hardware_cursors = "true";
    #Hint electron apps to use wayland
    NIXOS_OZONE_WL = "1";
  };


  #------------------------------------------------------------------#
  
  catppuccin.flavor = "mocha";
  catppuccin.enable = true;


  system.stateVersion = "24.05"; # Did you read the comment?

}
