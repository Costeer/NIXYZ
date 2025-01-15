{ config, lib, pkgs, ... }:

{
  # Create the config file if it doesn't exist
  home.file.".config/zed/settings.json".text = ''

    // Zed settings
    //
    // For information on how to configure Zed, see the Zed
    // documentation: https://zed.dev/docs/configuring-zed
    //
    // To see all of Zed's default settings without changing your
    // custom settings, run `zed: open default settings` from the
    // command palette (cmd-shift-p / ctrl-shift-p)
    {
      "telemetry": {
        "diagnostics": false
      },
      "terminal": {
        "font_family": "JetBrainsMono Nerd Font",
        "font_size": 15,
        "line_height": "standard"
      },
      "features": {
        "inline_completion_provider": "none"
      },
      "autosave": {
        "after_delay": {
          "milliseconds": 1
        }
      },
      "vim_mode": false,
      "ui_font_size": 16,
      "buffer_font_size": 16,
    
      "theme": {
        "mode": "system",
        "light": "One Light",
        "dark": "Catppuccin Mocha - No Italics"
      }
    }
    
 '';
}
