{ self, ... }:
{
  flake.homeModules.fonts =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    {

      preferences.aptPackages = [
        "fonts-noto"
        "fonts-noto-cjk"
        "fonts-noto-color-emoji"
        "fonts-dejavu"
      ];

      preferences.pacmanPackages = [
        "noto-fonts"
        "noto-fonts-cjk"
        "noto-fonts-emoji"
        "ttf-dejavu"
        "ttf-dejavu-nerd"
        "ttf-nerd-fonts-symbols"
        "ttf-nerd-fonts-symbols-mono"
      ];

      home.packages =
        with pkgs;
        [ ]
        ++ lib.optionals (config.preferences.distro == "ubuntu") [
          nerd-fonts.dejavu-sans-mono
          nerd-fonts.symbols-only
        ];

      # Allow fontconfig to discover fonts installed via home.packages
      fonts.fontconfig.enable = true;

    };
}
