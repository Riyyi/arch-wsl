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

        self.homeModules.emacs
        self.homeModules.firefox
        self.homeModules.ghostty
        self.homeModules.mangowc
        self.homeModules.noctalia
        self.homeModules.sound
        self.homeModules.vscode
      ];

      preferences.aptPackages = [
        "gedit"
        "gvfs"
        "imv"
        "kolourpaint"
        "libwayland-client0"
        "libwayland-cursor0"
        "libwayland-egl1"
        "libwayland-server0"
        "mpv"
        "pavucontrol"
        "wev"
        "thunar"
        "thunar-volman"
        "wayland-utils"
        "wl-clipboard"
        "xclip"
        "xdotool"
        "x11-utils"
        "xinput"
        "xserver-xorg-core"
        "xauth"
        "x11-xserver-utils"
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
        [
          chromium
        ]
        ++ lib.optionals (config.preferences.distro == "ubuntu") [
          xdo
          xwayland-satellite
        ];

    };
}
