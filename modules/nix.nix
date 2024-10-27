#-N.S.------------------------------------Nix-Settings------------------------------------------------#
{ config, pkgs, inputs, ... }: {
  nixpkgs.config.allowUnfree = true;
  nix = {
    extraOptions = ''
      warn-dirty = false
    '';
    settings = {
      auto-optimise-store = true;
      experimental-features = [ "nix-command" "flakes" ];
      substituters = [ "https://hyprland.cachix.org" ];
      trusted-public-keys = [
        "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
      ];
    };
#    gc = {
 #     automatic = true;
  #    persistent = true;
   #   dates = "weekly";
    #  options = "--delete-older-than 7d";
    #};
  };
}