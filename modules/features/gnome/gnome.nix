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

      # GNOME 46 extension that tracks current/previous workspace and exposes
      # a "switch to previous workspace" keybinding.
      previousWorkspaceExt = pkgs.stdenv.mkDerivation {
        pname = "gnome-shell-extension-previous-workspace";
        version = "1";
        src = ./extensions/previous-workspace;
        # Source is already a flat directory; no unpacking step needed.
        dontUnpack = true;

        nativeBuildInputs = [ pkgs.glib ];

        installPhase = ''
          runHook preInstall

          uuid="previous-workspace@dotfiles"
          dst="$out/share/gnome-shell/extensions/$uuid"
          mkdir -p "$dst"
          cp -r "$src"/. "$dst/"
          # Store source files are read-only; make the install tree writable
          # so glib-compile-schemas can drop its compiled output.
          chmod -R u+w "$dst"

          # gschema needs to be compiled for the shell to pick it up.
          glib-compile-schemas "$dst/schemas"

          runHook postInstall
        '';
      };

      # Third-party extension that suppresses the workspace switcher overlay
      # popup shown when switching between workspaces.
      # https://github.com/cleardevice/gnome-disable-workspace-switcher
      disableWorkspaceSwitcherOverlayExt = pkgs.stdenv.mkDerivation {
        pname = "gnome-shell-extension-disable-workspace-switcher-overlay";
        version = "7";
        src = ./extensions/disable-workspace-switcher-overlay;
        # Source is already a flat directory; no unpacking step needed.
        dontUnpack = true;

        installPhase = ''
          runHook preInstall

          uuid="disable-workspace-switcher-overlay@cleardevice"
          dst="$out/share/gnome-shell/extensions/$uuid"
          mkdir -p "$dst"
          cp -r "$src"/. "$dst/"
          chmod -R u+w "$dst"

          runHook postInstall
        '';
      };
    in
    {

      preferences.firefox.gnomeIntegration = true;

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

      dconf.settings = lib.mkMerge [
        # Workspaces
        {
          "org/gnome/mutter" = {
            dynamic-workspaces = false;
          };
          "org/gnome/desktop/wm/preferences" = {
            num-workspaces = 10;
          };
        }

        # Dock
        {
          "org/gnome/shell/extensions/dash-to-dock" = {
            dock-fixed = false;
            dock-position = "BOTTOM";
            extend-height = false;
          };
        }

        # Desktop
        {
          "org/gnome/shell/extensions/ding" = {
            show-home = false;
          };
          "org/gnome/desktop/background" = {
            show-desktop-icons = false;
          };
        }

        # Style
        {
          "org/gnome/desktop/interface" = {
            color-scheme = "prefer-dark";
          };
        }

        # Wallpaper
        {
          "org/gnome/desktop/background" = {
            picture-uri = "file://${config.preferences.user.home}/Pictures/Wallpapers/wallpaper.png";
            picture-uri-dark = "file://${config.preferences.user.home}/Pictures/Wallpapers/wallpaper.png";
            picture-options = "zoom";
          };
        }

        # ----------------------------------

        # Input tweaks
        {
          "org/gnome/desktop/wm/preferences" = {
            resize-with-right-button = true;
          };
          # TODO: uncomment
          # "org/gnome/desktop/input-sources" = {
          #   xkb-options = [ "caps:swapescape" ];
          # };
        }

        # ----------------------------------

        # Enable the previous-workspace GNOME extension.
        {
          "org/gnome/shell" = {
            enabled-extensions = [
              "previous-workspace@dotfiles"
              "disable-workspace-switcher-overlay@cleardevice"
            ];
            disable-user-extensions = false;
          };
          # Focus previous workspace
          "org/gnome/shell/extensions/workspace-previous" = {
            switch-to-previous-workspace = [ "<Super>grave" ];
          };
        }

        # ----------------------------------

        # Remap super -> super+d for Activities Overview page
        {
          "org/gnome/mutter" = {
            overlay-key = "";
          };
          "org/gnome/shell/keybindings" = {
            toggle-overview = [ "<Super>d" ];
          };
        }

        # Disable conflicting default bindings
        {
          "org/gnome/shell/keybindings" = {
            switch-to-application-1 = [ ];
            switch-to-application-2 = [ ];
            switch-to-application-3 = [ ];
            switch-to-application-4 = [ ];
            switch-to-application-5 = [ ];
            switch-to-application-6 = [ ];
            switch-to-application-7 = [ ];
            switch-to-application-8 = [ ];
            switch-to-application-9 = [ ];
          };
        }

        # Disable dock bindings, these conflict with binding super+<num>
        {
          "org/gnome/shell/extensions/dash-to-dock" = {
            hot-keys = false;
          };
        }

        # ----------------------------------

        # --- Window --- #

        {
          "org/gnome/desktop/wm/keybindings" = {
            close = [ "<Super>q" ];

            #-- State/flags --#

            # Toggle fullscreen mode
            toggle-fullscreen = [ "<Super>f" ];
            toggle-maximized = [ "<Super>g" ];

            #-- Focus --#

            # Focus workspace
            switch-to-workspace-1 = [ "<Super>1" ];
            switch-to-workspace-2 = [ "<Super>2" ];
            switch-to-workspace-3 = [ "<Super>3" ];
            switch-to-workspace-4 = [ "<Super>4" ];
            switch-to-workspace-5 = [ "<Super>5" ];
            switch-to-workspace-6 = [ "<Super>6" ];
            switch-to-workspace-7 = [ "<Super>7" ];
            switch-to-workspace-8 = [ "<Super>8" ];
            switch-to-workspace-9 = [ "<Super>9" ];
            switch-to-workspace-10 = [ "<Super>0" ];

            # Focus previous/next workspace
            switch-to-workspace-left = [ "<Super>minus" ];
            switch-to-workspace-right = [ "<Super>equal" ];

            #-- Move --#

            # Move window to workspace
            move-to-workspace-1 = [ "<Shift><Super>1" ];
            move-to-workspace-2 = [ "<Shift><Super>2" ];
            move-to-workspace-3 = [ "<Shift><Super>3" ];
            move-to-workspace-4 = [ "<Shift><Super>4" ];
            move-to-workspace-5 = [ "<Shift><Super>5" ];
            move-to-workspace-6 = [ "<Shift><Super>6" ];
            move-to-workspace-7 = [ "<Shift><Super>7" ];
            move-to-workspace-8 = [ "<Shift><Super>8" ];
            move-to-workspace-9 = [ "<Shift><Super>9" ];
            move-to-workspace-10 = [ "<Shift><Super>0" ];

            # Move previous/next workspace
            move-to-workspace-left = [ "<Shift><Super>minus" ];
            move-to-workspace-right = [ "<Shift><Super>equal" ];

            # Move to previous/next monitor
            move-to-monitor-left = [ "<Shift><Super>bracketleft" ];
            move-to-monitor-right = [ "<Shift><Super>bracketright" ];
          };
        }

        # ----------------------------------

        {
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
        }
      ];

      home.file =
        builtins.listToAttrs (
          # Deploy wallpapers from repo to home directory
          map (file: {
            name = "Pictures/Wallpapers/${file}";
            value = {
              source = ./dotfiles/Pictures/Wallpapers + "/${file}";
            };
          }) files
        )
        // {
          # Install the previous-workspace GNOME extension.
          ".local/share/gnome-shell/extensions/previous-workspace@dotfiles" = {
            source = "${previousWorkspaceExt}/share/gnome-shell/extensions/previous-workspace@dotfiles";
            recursive = true;
          };
          # Install the disable-workspace-switcher-overlay GNOME extension.
          ".local/share/gnome-shell/extensions/disable-workspace-switcher-overlay@cleardevice" = {
            source = "${disableWorkspaceSwitcherOverlayExt}/share/gnome-shell/extensions/disable-workspace-switcher-overlay@cleardevice";
            recursive = true;
          };
        };

    };
}

# TODO:
# - split fonts from theme.nix module
