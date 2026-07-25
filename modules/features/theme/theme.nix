{ self, ... }:
{
  flake.homeModules.theme =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    let
      dotfiles = config.preferences.path.dotfiles;

      # Calculate the subdirectory directory from root this module is in
      subDir = self.lib.subDir __curPos;

      files =
        if config.preferences.distro == "ubuntu" then
          [
            "ghostty/themes/noctalia"
          ]
        else
          [
            "ghostty/themes/noctalia"
            "gtk-3.0/gtk.css"
            "gtk-3.0/noctalia.css"
            "gtk-3.0/settings.ini"
            "gtk-4.0/gtk.css"
            "gtk-4.0/noctalia.css"
            "gtk-4.0/settings.ini"
            "xsettingsd/xsettingsd.conf"
          ];
    in
    {

      imports = [
        self.homeModules.fonts
      ];

      preferences.aptPackages = [
        "papirus-icon-theme"
        "libqt5gui5t64"
        "libqt6gui6t64"
      ];

      preferences.pacmanPackages = [
        "adw-gtk-theme"
        "capitaine-cursors"
        "nwg-look"
        "papirus-icon-theme"
        "qt5-base" # contains QGtk3Style implementation for Qt5
        "qt6-base" # contains QGtk3Style implementation for Qt6
      ];

      home.packages =
        with pkgs;
        [ ]
        ++ lib.optionals (config.preferences.distro == "ubuntu") [
          adw-gtk3
          capitaine-cursors
          nwg-look
        ];

      home.sessionVariables = {
        GTK_THEME = if config.preferences.distro == "ubuntu" then null else "adw-gtk3";

        # Qt apps use Gtk passthrough styling, for simplification
        # https://wiki.archlinux.org/title/Uniform_look_for_Qt_and_GTK_applications#QGtk3Style
        # https://danklinux.com/docs/dankmaterialshell/application-themes#option-1-gtk-passthrough-simple
        QT_QPA_PLATFORMTHEME = "gtk3";
        QT_QPA_PLATFORMTHEME_QT6 = "gtk3";

        XCURSOR_THEME = "capitaine-cursors-light";
        XCURSOR_SIZE = 24;
      };

      # TODO: also set for Ubuntu, when different themes have been figured out
      dconf.settings = lib.optionalAttrs (config.preferences.distro != "ubuntu") {
        "org/gnome/desktop/interface" = {
          color-scheme = "prefer-dark";
          gtk-theme = "adw-gtk3";
          icon-theme = "Papirus";
        };
      };

      home.file = builtins.listToAttrs (
        map (file: {
          name = ".config/${file}";
          value = {
            source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/${subDir}/dotfiles/${file}";
          };
        }) files
      );

    };
}
