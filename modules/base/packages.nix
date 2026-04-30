{
  flake.modules.generic.base =
    { lib, ... }:
    {
      options.preferences = {
        pacmanPackages = lib.mkOption {
          type = lib.types.listOf lib.types.str;
          default = [];
          description = "List of pacman packages to sync.";
        };
      };
    };
}
