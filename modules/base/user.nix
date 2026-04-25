{
  flake.modules.generic.base =
    { config, lib, ... }:
    {
      options.preferences = {
        user.name = lib.mkOption {
          type = lib.types.str;
          default = "rick";
        };

        user.home = lib.mkOption {
          type = lib.types.str;
          default = "/home/${config.preferences.user.name}";
        };

        user.git.name = lib.mkOption {
          type = lib.types.str;
          default = "Riyyi";
        };

        user.git.email = lib.mkOption {
          type = lib.types.str;
          default = "riyyi3@gmail.com";
        };
      };
    };
}
