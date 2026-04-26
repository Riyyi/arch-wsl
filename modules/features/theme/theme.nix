{ rootPath, ... }:
{
  flake.homeModules.theme =
    {
      config,
      lib,
      ...
    }:
    let
      home = config.preferences.user.home;
      dotfiles = config.preferences.path.dotfiles;

      # Calculate the subdirectory directory from root this module is in
      modDir = dirOf __curPos.file;
      subDir = lib.strings.removePrefix (toString rootPath + "/") (toString modDir);

      files = [
        "ghostty/themes/noctalia"
        "gtk-3.0/gtk.css"
        "gtk-3.0/noctalia.css"
        "gtk-3.0/settings.ini"
        "gtk-4.0/gtk.css"
        "gtk-4.0/noctalia.css"
        "gtk-4.0/settings.ini"
        "noctalia/colorschemes/One/One.json"
        "xsettingsd/xsettingsd.conf"
      ];
    in
    {

      preferences.pacmanPackages = [
        "adw-gtk-theme"
        "capitaine-cursors"
        "nwg-look"
        "papirus-icon-theme"
        "qt5-base" # contains QGtk3Style implementation for Qt5
        "qt6-base" # contains QGtk3Style implementation for Qt6
        "ttf-dejavu"
        "ttf-dejavu-nerd"
      ];

      home.sessionVariables = {
        GTK_THEME = "adw-gtk3";

        # Qt apps use Gtk passthrough styling, for simplification
        # https://wiki.archlinux.org/title/Uniform_look_for_Qt_and_GTK_applications#QGtk3Style
        # https://danklinux.com/docs/dankmaterialshell/application-themes#option-1-gtk-passthrough-simple
        QT_QPA_PLATFORMTHEME = "gtk3";
        QT_QPA_PLATFORMTHEME_QT6 = "gtk3";

        XCURSOR_THEME = "capitaine-cursors-white";
        XCURSOR_SIZE = 24;
      };

      # Don't link from the Nix store, so it remains writable
      home.activation.theme = builtins.concatStringsSep "\n" (
        map (file: ''
          mkdir -p "${home}/.config/${dirOf file}"
          ln -sf "${dotfiles}/${subDir}/dotfiles/${file}" \
                 "${home}/.config/${file}"
        '') files
      );

    };
}
