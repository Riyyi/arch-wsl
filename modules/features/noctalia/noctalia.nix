{ self, ... }:
{

  flake.homeModules.noctalia =
    { config, ... }:
    let
      dotfiles = config.preferences.path.dotfiles;

      # Calculate the subdirectory directory from root this module is in
      subDir = self.lib.subDir __curPos;

      modDir = dirOf __curPos.file;
      entries = builtins.readDir "${modDir}/dotfiles/Pictures/Wallpapers";
      files = builtins.filter (name: entries.${name} == "regular") (builtins.attrNames entries);
    in
    {

      preferences.pacmanPackages = [
        "brightnessctl"
        "cliphist"
        "evolution-data-server"
        "imagemagick"
        "noctalia-qs" # NOTE: put before noctalia-shell!
        "noctalia-shell"
        "power-profiles-daemon"
        "python"
        "wlsunset"
        "xdg-desktop-portal"
        "xdg-desktop-portal-gtk"
        "xdg-desktop-portal-gnome"
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
