{ self, ... }:
{
  # Module for generic stuff that every host needs

  flake.modules.generic.general = {
  };

  flake.homeModules.general = {

    imports = [
      self.homeModules.nix
      self.homeModules.environment
    ];

  };
}
