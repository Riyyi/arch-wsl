{ self, inputs, ... }:
{

  flake.homeConfigurations.arch-vm = inputs.home-manager.lib.homeManagerConfiguration {
    pkgs = import inputs.nixpkgs { system = "x86_64-linux"; };

    modules = [
      self.homeModules.hostArchVm
    ];
  };

  flake.homeModules.hostArchVm =
    {
      config,
      lib,
      ...
    }:
    let
      user = config.preferences.user.name;
      home = config.preferences.user.home;
      packages = config.preferences.pacmanPackages;
    in
    {

      imports = [
        self.modules.generic.base

        self.homeModules.arch
        self.homeModules.development
        self.homeModules.general
        self.homeModules.desktop
        self.homeModules.vmware

        {
          preferences.pacmanPackages = [
            "dhcpcd"
            "neovim"
            "networkmanager"
            "networkmanager-openconnect"
            "network-manager-applet" # this is required for the password prompt
            "nm-connection-editor"
          ];

          # Improve home-manager on non-NixOS distros
          targets.genericLinux = {
            enable = true;
            gpu.enable = true;
          };

          home.username = user;
          home.homeDirectory = home;

          xdg.enable = true;

          home.stateVersion = "25.11";

          home.activation.configuration = lib.hm.dag.entryAfter [ "pacmanPackages" ] ''
            /bin/sudo systemctl enable --now NetworkManager.service
          '';

        }
      ];

      home.activation.pacmanPackages = ''
        declpac="${config.xdg.configHome}/declpac"
        printf '%s\n' "${lib.concatStringsSep "\n" packages}" > $declpac
        _i "Pacman state file written to $declpac"
      '';

    };
}
