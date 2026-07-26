{
  flake.modules.generic.base =
    { lib, ... }:
    {
      options.preferences = {
        monitors = lib.mkOption {
          type = lib.types.listOf (
            lib.types.submodule {
              options = {
                name = lib.mkOption {
                  type = lib.types.str;
                  default = "";
                  description = "Monitor name regex (e.g. ^eDP-1$).";
                };
                make = lib.mkOption {
                  type = lib.types.str;
                  default = "";
                  description = "Optional monitor make/manufacturer.";
                };
                model = lib.mkOption {
                  type = lib.types.str;
                  default = "";
                  description = "Optional monitor model.";
                };
                serial = lib.mkOption {
                  type = lib.types.str;
                  default = "";
                  description = "Optional monitor serial number.";
                };
                width = lib.mkOption {
                  type = lib.types.int;
                  description = "Monitor width in pixels.";
                };
                height = lib.mkOption {
                  type = lib.types.int;
                  description = "Monitor height in pixels.";
                };
                refresh = lib.mkOption {
                  type = lib.types.int;
                  default = 60;
                  description = "Refresh rate in Hz.";
                };
                x = lib.mkOption {
                  type = lib.types.int;
                  default = 0;
                  description = "X position offset.";
                };
                y = lib.mkOption {
                  type = lib.types.int;
                  default = 0;
                  description = "Y position offset.";
                };
                scale = lib.mkOption {
                  type = lib.types.float;
                  default = 1.0;
                  description = "Scale factor.";
                };
              };
            }
          );
          default = [ ];
          description = "Monitors (left to right) to configure across compositors.";
        };
      };
    };
}
