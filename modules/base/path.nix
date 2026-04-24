{
  flake.modules.generic.base =
    { config, lib, ... }:
    {
      options.preferences = {
        path.dotfiles = lib.mkOption {
          type = lib.types.str;
          default = "/mnt/c/Users/Rick/Desktop/arch-wsl";
          description = "Path where this repo is cloned to.";
        };
      };
    };
}
