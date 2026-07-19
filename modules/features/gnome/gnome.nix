{
  flake.homeModules.gnome =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    let
      modDir = dirOf __curPos.file;
      entries = builtins.readDir "${modDir}/dotfiles/Pictures/Wallpapers";
      files = builtins.filter (name: entries.${name} == "regular") (builtins.attrNames entries);
    in
    {

      preferences.aptPackages = [
        "dconf-editor"
        "gnome-tweaks"
      ];

      preferences.pacmanPackages = [
        "dconf-editor"
        "gnome-tweaks"
      ];

      home.packages =
        with pkgs;
        [ ]
        ++ lib.optionals (config.preferences.distro == "ubuntu") [
        ];

      home.activation.gnome = lib.hm.dag.entryAfter [ "aptPackages" ] ''
        # Workspaces
        /bin/gsettings set org.gnome.mutter dynamic-workspaces false
        /bin/gsettings set org.gnome.desktop.wm.preferences num-workspaces 10

        # Dock
        /bin/gsettings set org.gnome.shell.extensions.dash-to-dock dock-fixed false
        /bin/gsettings set org.gnome.shell.extensions.dash-to-dock dock-position "'BOTTOM'"
        /bin/gsettings set org.gnome.shell.extensions.dash-to-dock extend-height false

        # Desktop
        /bin/gsettings set org.gnome.shell.extensions.ding show-home false
        /bin/gsettings set org.gnome.desktop.background show-deskop-icons false

        # Style
        /bin/gsettings set org.gnome.desktop.interface color-scheme "prefer-dark"

        # Wallpaper
        /bin/gsettings set org.gnome.desktop.background picture-uri \
          "file://${config.home.homeDirectory}/Pictures/Wallpapers/wallpaper.png"
        /bin/gsettings set org.gnome.desktop.background picture-uri-dark \
          "file://${config.home.homeDirectory}/Pictures/Wallpapers/wallpaper.png"
        /bin/gsettings set org.gnome.desktop.background picture-options "zoom"

        # ----------------------------------

        # Input tweaks
        /bin/gsettings set org.gnome.desktop.wm.preferences resize-with-right-button true
        #/bin/gsettings set org.gnome.desktop.input-sources xkb-options "['caps:swapescape']" #TODO: uncomment

        # ----------------------------------

        # Remap super -> super+d for Activities Overview page
        /bin/gsettings set org.gnome.mutter overlay-key ""
        /bin/gsettings set org.gnome.shell.keybindings toggle-overview "['<Super>d']"

        # Disable conflicting default bindings
        /bin/gsettings set org.gnome.shell.keybindings switch-to-application-1 "[]"
        /bin/gsettings set org.gnome.shell.keybindings switch-to-application-2 "[]"
        /bin/gsettings set org.gnome.shell.keybindings switch-to-application-3 "[]"
        /bin/gsettings set org.gnome.shell.keybindings switch-to-application-4 "[]"
        /bin/gsettings set org.gnome.shell.keybindings switch-to-application-5 "[]"
        /bin/gsettings set org.gnome.shell.keybindings switch-to-application-6 "[]"
        /bin/gsettings set org.gnome.shell.keybindings switch-to-application-7 "[]"
        /bin/gsettings set org.gnome.shell.keybindings switch-to-application-8 "[]"
        /bin/gsettings set org.gnome.shell.keybindings switch-to-application-9 "[]"

        # Disable dock bindings, these conflict with binding super+<num>
        /bin/gsettings set org.gnome.shell.extensions.dash-to-dock hot-keys false

        # ----------------------------------

        # --- Window --- #

        /bin/gsettings set org.gnome.desktop.wm.keybindings close "['<Super>q']"

        #-- State/flags --#

        # Toggle fullscreen mode
        /bin/gsettings set org.gnome.desktop.wm.keybindings toggle-fullscreen "['<Super>f']"
        /bin/gsettings set org.gnome.desktop.wm.keybindings toggle-maximized "['<Super>g']"

        #-- Focus --#

        # Focus workspace
        /bin/gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-1 "['<Super>1']"
        /bin/gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-2 "['<Super>2']"
        /bin/gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-3 "['<Super>3']"
        /bin/gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-4 "['<Super>4']"
        /bin/gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-5 "['<Super>5']"
        /bin/gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-6 "['<Super>6']"
        /bin/gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-7 "['<Super>7']"
        /bin/gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-8 "['<Super>8']"
        /bin/gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-9 "['<Super>9']"
        /bin/gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-10 "['<Super>0']"

        # Focus previous/next workspace
        /bin/gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-left "['<Super>minus']"
        /bin/gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-right "['<Super>equal']"

        #-- Move --#

        # Move window to workspace
        /bin/gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-1 "['<Shift><Super>1']"
        /bin/gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-2 "['<Shift><Super>2']"
        /bin/gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-3 "['<Shift><Super>3']"
        /bin/gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-4 "['<Shift><Super>4']"
        /bin/gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-5 "['<Shift><Super>5']"
        /bin/gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-6 "['<Shift><Super>6']"
        /bin/gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-7 "['<Shift><Super>7']"
        /bin/gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-8 "['<Shift><Super>8']"
        /bin/gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-9 "['<Shift><Super>9']"
        /bin/gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-10 "['<Shift><Super>0']"

        # Move previous/next workspace
        /bin/gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-left "['<Shift><Super>minus']"
        /bin/gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-right "['<Shift><Super>equal']"

        # Move to previous/next monitor
        /bin/gsettings set org.gnome.desktop.wm.keybindings move-to-monitor-left "['<Shift><Super>bracketleft']"
        /bin/gsettings set org.gnome.desktop.wm.keybindings move-to-monitor-right "['<Shift><Super>bracketright']"
      '';

      dconf.settings = {
        "org/gnome/settings-daemon/plugins/media-keys" = {
          custom-keybindings = [
            "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
          ];
        };

        "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
          name = "Terminal";
          command = "ghostty";
          binding = "<Super>Return";
        };
      };

      home.file = builtins.listToAttrs (
        # Deploy wallpapers from repo to home directory
        map (file: {
          name = "Pictures/Wallpapers/${file}";
          value = {
            source = ./dotfiles/Pictures/Wallpapers + "/${file}";
          };
        }) files
      );

    };
}

# TODO:
# - split fonts from theme.nix module
