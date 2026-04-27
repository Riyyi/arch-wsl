{
  flake.modules.generic.base =
    { lib, ... }:
    {
      options.preferences = {

        shell.aliases = lib.mkOption {
          type = lib.types.attrsOf lib.types.str;
          default = {};
          description = "Set of aliases to append to the existing zsh aliases.";
        };

      };
    };
}
