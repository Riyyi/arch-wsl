{ self, inputs, ... }:
{

  flake.homeConfigurations.arch-desktop = inputs.home-manager.lib.homeManagerConfiguration {
    pkgs = import inputs.nixpkgs { system = "x86_64-linux"; };

    modules = [
      self.homeModules.hostArchDesktop
    ];
  };

  flake.homeModules.hostArchDesktop =
    {
      config,
      lib,
      ...
    }:
    let
      user = config.preferences.user.name;
      home = config.preferences.user.home;
    in
    {

      imports = [
        self.modules.generic.base

        self.homeModules.arch
        self.homeModules.desktop
        self.homeModules.development
        self.homeModules.general
        self.homeModules.greeter
        self.homeModules.mangowc
        self.homeModules.noctalia
        self.homeModules.systemdUserUnits

        {
          preferences.pacmanPackages = [
            "dhcpcd"
            "neovim"
            "networkmanager"
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

          home.stateVersion = "26.05";

          home.activation.configuration = lib.hm.dag.entryAfter [ "pacmanPackages" ] ''
            /bin/sudo systemctl enable --now NetworkManager.service
          '';

          sops.secrets.zshrc-extended = {
            # owner = user; # not available in home-manager standalone
            mode = "0550"; # add execute permissions
            sopsFile = ./../../features/sops/secrets/arch-desktop/zshrc-extended.sh; # from
            key = "data"; # what
            path = "${home}/.config/zsh/.zshrc-extended"; # to
          };

        }
      ];

    };
}
