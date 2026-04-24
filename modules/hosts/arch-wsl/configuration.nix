{ self, inputs, ... }:
{

  flake.homeConfigurations.arch-wsl = inputs.home-manager.lib.homeManagerConfiguration {
    pkgs = import inputs.nixpkgs { system = "x86_64-linux"; };

    modules = [
      self.homeModules.hostArchWsl
    ];
  };

  flake.homeModules.hostArchWsl =

    { config, pkgs, ... }:

    {
      imports = [

        self.modules.generic.base
        self.modules.generic.general
	 
        {

          home.username = "${config.preferences.user.name}";
          home.homeDirectory = "${config.preferences.user.home}";

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

    };

}
