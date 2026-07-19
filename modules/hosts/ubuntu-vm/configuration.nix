{ self, inputs, ... }:
{

  flake.homeConfigurations.ubuntu-vm = inputs.home-manager.lib.homeManagerConfiguration {
    pkgs = import inputs.nixpkgs { system = "x86_64-linux"; };

    modules = [
      self.homeModules.hostUbuntuVm
    ];
  };

  flake.homeModules.hostUbuntuVm =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    let
      user = config.preferences.user.name;
      home = config.preferences.user.home;
    in
    {

      imports = [
        self.modules.generic.base

        self.homeModules.development
        self.homeModules.general
        self.homeModules.ghostty
        self.homeModules.systemdUserUnits

        {
          preferences.distro = "ubuntu";

          preferences.zsh.initExtra = ''
            # Host-specific zsh init
            export MY_HOST_VAR="ubuntu-vm"
          '';

          preferences.zsh.aliasesExtra = {
            vmctl = "virsh list --all";
          };

          preferences.aptPackages = [
          ];

          # Improve home-manager on non-NixOS distros
          targets.genericLinux = {
            enable = true;
            gpu.enable = true;
          };

          home.username = user;
          home.homeDirectory = home;

          home.packages = with pkgs; [
          ];

          xdg.enable = true;

          home.stateVersion = "26.05";

          home.activation.configuration = lib.hm.dag.entryAfter [ "aptPackages" ] ''
          '';

          #sops.secrets.zshrc-extended = {
          #  # owner = user; # not available in home-manager standalone
          #  mode = "0550"; # add execute permissions
          #  sopsFile = ./../../features/sops/secrets/ubuntu-vm/zshrc-extended.sh; # from
          #  key = "data"; # what
          #  path = "${home}/.config/zsh/.zshrc-extended"; # to
          #};

        }
      ];

    };
}
