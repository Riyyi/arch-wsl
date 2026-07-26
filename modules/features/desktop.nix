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
        self.homeModules.sound
        self.homeModules.vscode
      ];

      preferences.aptPackages = [
        "gedit"
        "gvfs"
        "gvfs-backends"
        "imv"
        "kolourpaint"
        "libwayland-client0"
        "libwayland-cursor0"
        "libwayland-egl1"
        "libwayland-server0"
        "mpv"
        "pavucontrol"
        "polkit-kde-agent-1"
        "thunar"
        "thunar-volman"
        "wayland-utils"
        "wev"
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
        "chromium"
        "gedit"
        "gvfs"
        "gvfs-mtp"
        "imv"
        "kolourpaint"
        "mpv"
        "pavucontrol"
        "polkit-kde-agent"
        "thunar"
        "thunar-volman"
        "udisks2"
        "wayland"
        "wayland-utils"
        "wev"
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
        ]
        ++ lib.optionals (config.preferences.distro == "ubuntu") [
          chromium
          xdo
          xwayland-satellite
        ];

    };
}
