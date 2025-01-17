{ config, pkgs, inputs, ... }:

{
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-emoji
    liberation_ttf
    fira-code
    fira-code-symbols
    mplus-outline-fonts.githubRelease
    dina-font
    proggyfonts
    cantarell-fonts
    jetbrains-mono
    ###---NerdFonts---### 
    nerd-fonts.fira-code 
    nerd-fonts.droid-sans-mono
    nerd-fonts.jetbrains-mono
  ];
}
