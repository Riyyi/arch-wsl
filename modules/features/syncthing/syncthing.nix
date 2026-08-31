{ self, ... }:
{
  flake.homeModules.syncthing =
    { config, pkgs, ... }:
    let
      dotfiles = config.preferences.path.dotfiles;

      # Calculate the subdirectory path from repo root this module is in
      subDir = self.lib.subDir __curPos;

      files = [
        ".config/.stignore"
        ".local/bin/.stignore"
        ".local/share/.stignore"
        "documents/.stignore"
        "documents/org/.stignore"
      ];

      addFolder =
        { id, path }:
        {
          inherit id;
          path = "~/${path}";
          devices = [
            "arch-desktop"
            "arch-laptop"
            "debian-vps"
            "nixos-nas"
          ];
          versioning.type = "simple";
        };
    in
    {
      home.packages = with pkgs; [
        syncthing
      ];

      services.syncthing = {
        enable = true;

        settings = {
          gui = {
            address = "127.0.0.1:8384"; # localhost only, no remote access
          };
          options = {
            crashReportingEnabled = false;
            urAccepted = -1; # disable usage data collection
          };
          devices = {
            "arch-desktop" = {
              id = "QHSELGQ-7WWMSGI-GBI6JKB-QHTT34A-WG6LFZ2-L2M4HBF-P6KHSVY-SQ7NVA3";
            };
            "arch-laptop" = {
              id = "6PINF5J-PNZOSK6-6I4RZPD-ZTN63YM-O4XF4EX-OYAIA6D-VP4I2MS-ZLI7KQM";
            };
            "debian-vps" = {
              id = "PKEBMIL-XRZV5HG-ZPRKMIM-7VVL7AT-62YVBH7-SADHWFY-S4I2CPU-BDP2WA2";
            };
            "nixos-nas" = {
              id = "IWFF67I-4TQI4SX-VTZCNLY-O4VFXY5-7LTUF2W-OUEYN7W-HBCPKK4-CUTUIA2";
            };
          };
          folders = {
            "Config" = addFolder {
              id = "lwq5v-etaxu";
              path = ".config";
            };
            "Documents Root" = addFolder {
              id = "bngf2-vvuwd";
              path = "documents";
            };
            "Local" = addFolder {
              id = "wukrh-fq9tn";
              path = ".local/share";
            };
            "Org" = addFolder {
              id = "jhv4y-mmmb9";
              path = "documents/org";
            };
            "SSH" = addFolder {
              id = "dia9g-xghyy";
              path = ".ssh";
            };
            "Scripts" = addFolder {
              id = "x2ns4-4nebl";
              path = ".local/bin";
            };
            "Share" = addFolder {
              id = "default";
              path = "documents/share";
            };
          };
        };
      };

      home.file = builtins.listToAttrs (
        map (file: {
          name = file;
          value.source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/${subDir}/dotfiles/${file}";
        }) files
      );

    };
}
