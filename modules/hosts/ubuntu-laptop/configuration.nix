{ self, inputs, ... }:
{

  flake.homeConfigurations.VLO-CAP-NC19 = inputs.home-manager.lib.homeManagerConfiguration {
    pkgs = import inputs.nixpkgs { system = "x86_64-linux"; };

    modules = [
      self.homeModules.hostUbuntuLaptop
    ];
  };

  flake.homeModules.hostUbuntuLaptop =
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
        self.homeModules.gnome
        self.homeModules.desktop
        self.homeModules.systemdUserUnits
        self.homeModules.ubuntu

        {
          preferences.aptPackages = [
            "dhcpcd"
            "neovim"
            "network-manager"
            "network-manager-openconnect"
            "network-manager-openconnect-gnome"
            "network-manager-gnome" # this is required for the password prompt
          ];

          # Improve home-manager on non-NixOS distros
          targets.genericLinux = {
            enable = true;
            gpu.enable = true;
          };

          home.username = user;
          home.homeDirectory = home;

          home.packages = with pkgs; [
            unstable.claude-code
            unstable.teams-for-linux
          ];

          xdg.enable = true;

          home.stateVersion = "25.11";

          home.activation.configuration = lib.hm.dag.entryAfter [ "aptPackages" ] "";

          sops.secrets.zshrc-extended = {
            # owner = user; # not available in home-manager standalone
            mode = "0550"; # add execute permissions
            sopsFile = ./../../features/sops/secrets/ubuntu-laptop/zshrc-extended.sh; # from
            key = "data"; # what
            path = "${home}/.config/zsh/.zshrc-extended"; # to
          };

        }
      ];

    };
}
