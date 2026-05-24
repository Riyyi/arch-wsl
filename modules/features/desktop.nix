{ self, ... }:
{
  flake.homeModules.desktop = {

    imports = [
      self.homeModules.keyring
      self.homeModules.theme
      self.homeModules.greeter

      self.homeModules.awesome
      self.homeModules.emacs
      self.homeModules.firefox
      self.homeModules.ghostty
      self.homeModules.niri
      self.homeModules.noctalia
      self.homeModules.sound
      self.homeModules.vscode
    ];

    preferences.pacmanPackages = [
      "gedit"
      "gvfs"
      "imv"
      "kolourpaint"
      "mpv"
      "pavucontrol"
      "wev"
      "thunar"
      "thunar-volman"
      "wayland"
      "wayland-utils"
      "wl-clipboard"
      "xclip"
      "xdo"
      "xdotool"
      "xorg-server"
      "xorg-xev"
      "xorg-xinput"
      "xorg-xprop"
      "xorg-xrandr"
      "xwayland-satellite"
    ];

  };
}
