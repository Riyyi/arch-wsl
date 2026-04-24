{ self, inputs, ... }:
{

  flake.homeConfigurations.arch-wsl = inputs.home-manager.lib.homeManagerConfiguration {
    pkgs = import inputs.nixpkgs { system = "x86_64-linux"; };

    modules = [
      self.homeModules.hostArchWsl
    ];
  };

  flake.homeModules.hostArchWsl =

    {
      config,
      lib,
      pkgs,
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
        self.modules.generic.general

        self.homeModules.nvim
        self.homeModules.ghostty

        {

          home.username = user;
          home.homeDirectory = home;

          xdg.enable = true;

          home.packages = with pkgs; [
            ncdu
            #ghostty
            kdePackages.konsole
            #self.packages.${pkgs.stdenv.hostPlatform.system}.niri
            #self.packages.${pkgs.stdenv.hostPlatform.system}.noctalia-shell
          ];

          home.stateVersion = "25.11";

        }
      ];

     home.activation.pacmanPackages =
       ''
         for package in ${lib.concatStringsSep " " packages}; do
           echo "Installing pacman package: $package"
         done
       '';

    };

}
