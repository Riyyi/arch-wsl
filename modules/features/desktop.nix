{ self, ... }:
{
  flake.homeModules.desktop = {

    imports = [
      self.homeModules.keyring
      self.homeModules.theme
      self.homeModules.greeter

      self.homeModules.firefox
      self.homeModules.ghostty
      self.homeModules.niri
      self.homeModules.noctalia
      self.homeModules.vscode
    ];

    preferences.pacmanPackages = [
      "gedit"
      "gvfs"
      "imv"
      "kolourpaint"
      "mpv"
      "wev"
      "thunar"
      "thunar-volman"
      "wayland"
      "wayland-utils"
      "wl-clipboard"
      "xwayland-satellite"
    ];

  };
}
