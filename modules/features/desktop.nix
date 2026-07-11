{ self, ... }:
{
  flake.homeModules.desktop =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    {

      imports = [
        self.homeModules.keyring
        self.homeModules.theme
        self.homeModules.greeter

        self.homeModules.awesome
        self.homeModules.emacs
        self.homeModules.firefox
        self.homeModules.ghostty
        self.homeModules.mangowc
        self.homeModules.niri
        self.homeModules.noctalia
        self.homeModules.sound
        self.homeModules.vscode
      ];

      preferences.aptPackages = [
        "gedit"
        "gvfs"
        "imv"
        "kolourpaint"
        "libwayland-client"
        "libwayland-cursor"
        "libwayland-egl"
        "libwayland-server"
        "mpv"
        "pavucontrol"
        "wev"
        "Thunar"
        "thunar-volman"
        "wayland-utils"
        "wl-clipboard"
        "xclip"
        "xdotool"
        "xev"
        "xinput"
        "xorg-x11-server-Xorg"
        "xorg-x11-xauth"
        "xprop"
        "xrandr"
        "xrdb"
        "xwayland-satellite"
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
        "xorg-xauth"
        "xorg-xev"
        "xorg-xinput"
        "xorg-xprop"
        "xorg-xrandr"
        "xorg-xrdb"
        "xwayland-satellite"
      ];

      home.packages =
        with pkgs;
        [ ]
        ++ lib.optionals (config.preferences.distro == "ubuntu") [
          xdo
        ];

    };
}
