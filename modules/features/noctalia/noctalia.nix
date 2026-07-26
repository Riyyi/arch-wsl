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

      home.packages = with pkgs; [
        noctalia-qs
        noctalia-shell
      ];

      preferences.ghostty.theme = "noctalia";

      home.file =
        builtins.listToAttrs (
          # Deploy wallpapers from repo to home directory
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

      # noctalia-shell loads pam_unix.so from the Nix store, which is hard-coded
      # to exec the setuid helper at /run/wrappers/bin/unix_chkpwd. That path
      # only exists on NixOS. On Arch the setuid helper lives at
      # /usr/sbin/unix_chkpwd, so PAM can never validate the password.
      # Fix: create a tmpfiles.d drop-in that symlinks the expected path to the
      # Arch helper, and apply it now. /run is tmpfs so the symlink is recreated
      # on every boot by systemd-tmpfiles.
      home.activation.noctaliaPamChkpwd = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
        $DRY_RUN_CMD /bin/sudo install -d -m0755 /usr/lib/tmpfiles.d
        $DRY_RUN_CMD /bin/sudo sh -c 'printf "%s\n%s\n" "d /run/wrappers 0755 root root -" "L /run/wrappers/bin/unix_chkpwd - - - - /usr/sbin/unix_chkpwd" > /usr/lib/tmpfiles.d/noctalia-pam.conf'
        $DRY_RUN_CMD /bin/sudo systemd-tmpfiles --create
      '';
    };
}
