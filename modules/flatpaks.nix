{ config, pkgs, inputs, ... }:
{

  services.flatpak.packages = [
#   { appId = "---"; origin = "flathub"; }

    { appId = "dev.vencord.Vesktop"; origin = "flathub";  }

    { appId = "im.fluffychat.Fluffychat"; origin = "flathub";  }

    { appId = "io.github.zen_browser.zen"; origin = "flathub";  }

  ];
 
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

}
