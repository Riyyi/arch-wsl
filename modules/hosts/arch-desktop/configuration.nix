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
        self.homeModules.games
        self.homeModules.general
        self.homeModules.greeter
        self.homeModules.mangowc
        self.homeModules.noctalia
        self.homeModules.syncthing
        self.homeModules.systemdUserUnits

        {
          preferences.monitors = [
            {
              make = "Ancor Communications Inc";
              model = "ASUS PB298";
              width = 2560;
              height = 1080;
              refresh = 59.978001;
              x = 0;
              y = 0;
              scale = 1.0;
            }
            {
              make = "Iiyama North America";
              model = "PL2492H";
              width = 1920;
              height = 1080;
              refresh = 60;
              x = 2560;
              y = 50;
              scale = 1.0;
            }
          ];

          preferences.pacmanPackages = [
            "dhcpcd"
            "neovim"
            "networkmanager"
            "network-manager-applet" # this is required for the password prompt
            "nm-connection-editor"

            # TODO: GPU module?
            "lib32-mesa"
            "lib32-vulkan-icd-loader"
            "lib32-vulkan-radeon"
            "mesa"
            "vulkan-icd-loader"
            "vulkan-radeon"
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
