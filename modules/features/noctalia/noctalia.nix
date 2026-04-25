{ dot, ... }:
{

  flake.homeModules.noctalia =
    { config, ... }:
    let
      home = config.preferences.user.home;
      dotfiles = config.preferences.path.dotfiles;

      subDir = dot.subDir __curPos;

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
      home.file = builtins.listToAttrs (
        map (file: {
          name = "Pictures/Wallpapers/${file}";
          value = {
            source = ./dotfiles/Pictures/Wallpapers + "/${file}";
          };
        }) files
      );

      # settings.json and colorschemes wont be linked from Nix store, so it remains writable
      home.activation.noctalia = ''
        ln -sf "${dotfiles}/${subDir}/dotfiles/.config/noctalia/settings.json" \
               "${home}/.config/noctalia/settings.json"

        ln -sf "${dotfiles}/${subDir}/dotfiles/.config/noctalia/colorschemes" \
               "${home}/.config/noctalia/colorschemes"
      '';

    };
}
