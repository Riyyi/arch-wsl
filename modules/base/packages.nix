{
  flake.modules.generic.base =
    { lib, ... }:
    {
      options.preferences = {
        distro = lib.mkOption {
          type = lib.types.enum [
            "arch"
            "ubuntu"
          ];
          default = "arch";
          description = "Distro to assume package installation for.";
        };

        aptPackages = lib.mkOption {
          type = lib.types.listOf lib.types.str;
          default = [ ];
          description = "List of apt packages to sync.";
        };

        pacmanPackages = lib.mkOption {
          type = lib.types.listOf lib.types.str;
          default = [ ];
          description = "List of pacman packages to sync.";
        };
      };
    };
}
