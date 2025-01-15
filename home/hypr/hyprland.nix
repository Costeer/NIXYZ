{ config, lib, pkgs, ... }:

{
  # Create the fastfetch config file if it doesn't exist
  home.file.".config/hypr/hyprland.conf".text = ''

    ###---Cursor---###
    
    exec = gsettings set org.gnome.desktop.interface gtk-theme "Catppuccin-Purple-Dark"
    exec = gsettings set org.gnome.desktop.interface color-scheme "prefer-dark"
    exec-once = hyprctl setcursor Bibata-Modern-Ice 24
    exec-once = XCURSOR_THEME Bibata-Modern-Ice 24
    exec-once = hyprpaper
    env = ELECTRON_OZONE_PLATFORM_HINT,auto
    
    
    binde =, XF86AudioRaiseVolume, exec, wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 5%+
    binde =, XF86AudioLowerVolume, exec, wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 5%-
    bind =, XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
    bind =, XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
    bindl =, XF86AudioPlay, exec, playerctl play-pause # the stupid key is called play , but it toggles 
    bindl =, XF86AudioNext, exec, playerctl next 
    bindl =, XF86AudioPrev, exec, playerctl previous
    bind  =  SUPER , F , fullscreen
    bind  =, Print , exec, hyprshot -m region  
    ################
    ### MONITORS ###
    ################
    
    # See https://wiki.hyprland.org/Configuring/Monitors/
    monitor= DP-1, 1920x1080, 0x0, auto
    monitor= HDMI-A-1, 1920x1080, 1920x0, auto
    
    env = LIBVA_DRIVER_NAME,nvidia
    env = XDG_SESSION_TYPE,wayland
    env = GBM_BACKEND,nvidia-drm
    env = __GLX_VENDOR_LIBRARY_NAME,nvidia
    
    cursor {
        no_hardware_cursors = true
    }
    
    
    ###################
    ### MY PROGRAMS ###
    ###################
    
    # See https://wiki.hyprland.org/Configuring/Keywords/
    
    # Set programs that you use
    $terminal = kitty
    $fileManager = dolphin
    $menu = ./.config/rofi/launcher.sh
    $powermenu = ./.config/rofi/powermenu.sh
    
    #################
    ### AUTOSTART ###
    #################
    
    # Autostart necessary processes (like notifications daemons, status bars, etc.)
    # Or execute your favorite apps at launch like this:
    
    # exec-once = $terminal
    # exec-once = nm-applet &
    # exec-once = waybar & hyprpaper & firefox
    
    
    #############################
    ### ENVIRONMENT VARIABLES ###
    #############################
    
    # See https://wiki.hyprland.org/Configuring/Environment-variables/
    
    
    #####################
    ### LOOK AND FEEL ###
    #####################
    
    # Refer to https://wiki.hyprland.org/Configuring/Variables/
    
    # https://wiki.hyprland.org/Configuring/Variables/#general
    general { 
        gaps_in = 5
        gaps_out = 20
    
        border_size = 3
        resize_on_border=1
        hover_icon_on_border=false
    
    
        # https://wiki.hyprland.org/Configuring/Variables/#variable-types for info about colors
    
        col.active_border = rgba(c6a0f6ff) rgba(b7bdf8ff) 30deg 
        #col.inactive_border = rgba(179, 255, 26, 0.933)
    
        # Set to true enable resizing windows by clicking and dragging on borders and gaps
        resize_on_border = true 
    
    
        # Please see https://wiki.hyprland.org/Configuring/Tearing/ before you turn this on
        allow_tearing = false
    
        layout = dwindle
    }
    
    # https://wiki.hyprland.org/Configuring/Variables/#decoration
    decoration {
        rounding = 13
    
        # Change transparency of focused and unfocused windows
        active_opacity = 0.95
        inactive_opacity = 0.8
    
        shadow {
              enabled = true
              range = 4
              render_power = 3
              color = rgba(1a1a1aee)
        }
        # https://wiki.hyprland.org/Configuring/Variables/#blur
        blur {
            enabled = true
            size = 8
            passes = 2
            noise = 0
            vibrancy = 0
        }
    }
    
    # https://wiki.hyprland.org/Configuring/Variables/#animations
    animations {
        enabled = true
    
        # Default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more
    
        bezier = myBezier, 0.05, 0.9, 0.1, 1.05
    
        animation = windows, 1, 7, myBezier
        animation = windowsOut, 1, 7, default, popin 80%
        animation = border, 1, 10, default
        animation = borderangle, 1, 8, default
        animation = fade, 1, 7, default
        animation = workspaces, 1, 6, default
    }
    
    # See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
    dwindle {
        pseudotile = true # Master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
        preserve_split = true # You probably want this
    }
    
    # See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
    master {
        new_status = master
    }
    
    # https://wiki.hyprland.org/Configuring/Variables/#misc
    misc { 
       # force_default_wallpaper = -1 # Set to 0 or 1 to disable the anime mascot wallpapers
       # disable_hyprland_logo = true # If true disables the random hyprland logo / anime girl background. :(
    }
    
    #############
    ### INPUT ###
    #############
    
    # https://wiki.hyprland.org/Configuring/Variables/#input
    input {
        kb_layout = de
        kb_variant = ,qwertz
        kb_model =
        kb_options =
        kb_rules =
    
        follow_mouse = 1
    
        sensitivity = 0 # -1.0 - 1.0, 0 means no modification.
    
        touchpad {
            natural_scroll = false
        }
    }
    
    # https://wiki.hyprland.org/Configuring/Variables/#gestures
    gestures {
        workspace_swipe = false
    }
    
    # Example per-device config
    # See https://wiki.hyprland.org/Configuring/Keywords/#per-device-input-configs for more
    device {
        name = epic-mouse-v1
        sensitivity = -0.5
    }
    
    
    ###################
    ### KEYBINDINGS ###
    ###################
    
    # See https://wiki.hyprland.org/Configuring/Keywords/
    $mainMod = SUPER # Sets "Windows" key as main modifier
    
    # Example binds, see https://wiki.hyprland.org/Configuring/Binds/ for more
    bind = $mainMod, T, exec, $terminal
    bind = $mainMod, C, killactive,
    bind = $mainMod, M, exit,
    bind = $mainMod, E, exec, $fileManager
    bind = $mainMod, V, togglefloating,
    bind = $mainMod, R, exec, $menu
    bind = $mainMod, P, pseudo, # dwindle
    bind = $mainMod, J, togglesplit, # dwindle
    bind = $mainMod, delete, exec, $powermenu
    # Move focus with mainMod + arrow keys
    bind = $mainMod, left, movefocus, l
    bind = $mainMod, right, movefocus, r
    bind = $mainMod, up, movefocus, u
    bind = $mainMod, down, movefocus, d
    
    # Switch workspaces with mainMod + [0-9]
    bind = $mainMod, 1, workspace, 1
    bind = $mainMod, 2, workspace, 2
    bind = $mainMod, 3, workspace, 3
    bind = $mainMod, 4, workspace, 4
    bind = $mainMod, 5, workspace, 5
    bind = $mainMod, 6, workspace, 6
    bind = $mainMod, 7, workspace, 7
    bind = $mainMod, 8, workspace, 8
    bind = $mainMod, 9, workspace, 9
    bind = $mainMod, 0, workspace, 10
    
    # Move active window to a workspace with mainMod + SHIFT + [0-9]
    bind = $mainMod SHIFT, 1, movetoworkspace, 1
    bind = $mainMod SHIFT, 2, movetoworkspace, 2
    bind = $mainMod SHIFT, 3, movetoworkspace, 3
    bind = $mainMod SHIFT, 4, movetoworkspace, 4
    bind = $mainMod SHIFT, 5, movetoworkspace, 5
    bind = $mainMod SHIFT, 6, movetoworkspace, 6
    bind = $mainMod SHIFT, 7, movetoworkspace, 7
    bind = $mainMod SHIFT, 8, movetoworkspace, 8
    bind = $mainMod SHIFT, 9, movetoworkspace, 9
    bind = $mainMod SHIFT, 0, movetoworkspace, 10
    
    # Example special workspace (scratchpad)
    bind = $mainMod, S, togglespecialworkspace, magic
    bind = $mainMod SHIFT, S, movetoworkspace, special:magic
    
    # Scroll through existing workspaces with mainMod + scroll
    bind = $mainMod, mouse_down, workspace, e+1
    bind = $mainMod, mouse_up, workspace, e-1
    
    # Move/resize windows with mainMod + LMB/RMB and dragging
    bindm = $mainMod, mouse:272, movewindow
    bindm = $mainMod, mouse:273, resizewindow
    
    # Laptop multimedia keys for volume and LCD brightness
    bindel = ,XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+
    bindel = ,XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
    bindel = ,XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
    bindel = ,XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle
    bindel = ,XF86MonBrightnessUp, exec, brightnessctl s 10%+
    bindel = ,XF86MonBrightnessDown, exec, brightnessctl s 10%-
    
    ##############################
    ### WINDOWS AND WORKSPACES ###
    ##############################
    
    # See https://wiki.hyprland.org/Configuring/Window-Rules/ for more
    # See https://wiki.hyprland.org/Configuring/Workspace-Rules/ for workspace rules
    
    # Example windowrule v1
    # windowrule = float, ^(kitty)$
    
    # Example windowrule v2
    # windowrulev2 = float,class:^(kitty)$,title:^(kitty)$
    
    windowrulev2 = suppressevent maximize, class:.* # You'll probably like this.
    env = ELECTRON_OZONE_PLATFORM_HINT,auto
    env = NVD_BACKEND,direct
    env = HYPRSHOT_DIR,/home/costeer/Pictures/hypershot/
    
    #bind = SUPER, grave, hyprexpo:expo, toggle # can be: toggle, off/disable or on/enable
    
    
    plugin {
        hyprexpo {
            columns = 3
            gap_size = 5
            bg_col = rgb(111111)
            workspace_method = center current # [center/first] [workspace] e.g. first 1 or center m+1
    
            enable_gesture = true # laptop touchpad
            gesture_fingers = 3  # 3 or 4
            gesture_distance = 300 # how far is the "max"
            gesture_positive = true # positive = swipe down. Negative = swipe up.
        }
    }


  '';
  }