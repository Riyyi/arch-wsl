{ self, ... }:
{
  # Module for generic stuff that every host needs

  flake.modules.generic.general =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    let
      selfpkgs = self.packages.${pkgs.stdenv.hostPlatform.system};
    in
    {
      imports = [
      ];

      #users.users.${config.home.username} = {
      #  isNormalUser = true;
      #  description = "${config.preferences.user.name}";
      #  extraGroups = [
      #    "networkmanager"
      #    "wheel"
      #  ];
      #  #shell = lib.getExe selfpkgs.environment;
      #};
    };
}
