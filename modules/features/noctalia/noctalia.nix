{ self, ... }:
{

  flake.homeModules.noctalia =
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

      modDir = dirOf __curPos.file;
      entries = builtins.readDir "${modDir}/dotfiles/Pictures/Wallpapers";
      files = builtins.filter (name: entries.${name} == "regular") (builtins.attrNames entries);
    in
    {

      preferences.aptPackages = [
        "brightnessctl"
        "cliphist"
        "evolution-data-server"
        "imagemagick"
        "power-profiles-daemon"
        "python3"
        "wlsunset"
        "xdg-desktop-portal"
        "xdg-desktop-portal-gtk"
        "xdg-desktop-portal-gnome"
      ];

      preferences.pacmanPackages = [
        "brightnessctl"
        "cliphist"
        "evolution-data-server"
        "imagemagick"
        "power-profiles-daemon"
        "python"
        "wlsunset"
        "xdg-desktop-portal"
        "xdg-desktop-portal-gtk"
        "xdg-desktop-portal-gnome"
      ];

      home.packages =
        with pkgs;
        [
        ]
        ++ lib.optionals (config.preferences.distro == "ubuntu") [
          noctalia-qs
          noctalia-shell
        ];

      # Deploy wallpapers from repo to home directory
      home.file =
        builtins.listToAttrs (
          map (file: {
            name = "Pictures/Wallpapers/${file}";
            value = {
              source = ./dotfiles/Pictures/Wallpapers + "/${file}";
            };
          }) files
        )
        // {
          # Dont link these from the Nix store, so it remains writable
          ".config/noctalia/plugins.json".source =
            config.lib.file.mkOutOfStoreSymlink "${dotfiles}/${subDir}/dotfiles/.config/noctalia/plugins.json";

          ".config/noctalia/settings.json".source =
            config.lib.file.mkOutOfStoreSymlink "${dotfiles}/${subDir}/dotfiles/.config/noctalia/settings.json";

          ".config/noctalia/colorschemes".source =
            config.lib.file.mkOutOfStoreSymlink "${dotfiles}/${subDir}/dotfiles/.config/noctalia/colorschemes";
        };

    };
}
