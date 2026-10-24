{
  flake.homeModules.screenshot =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    {

      options.preferences.screenshot = {
        dir = lib.mkOption {
          type = lib.types.str;
          default = "${config.preferences.user.home}/Pictures/Screenshots";
          defaultText = lib.literalExpression ''"''${config.preferences.user.home}/Pictures/Screenshots"'';
          description = "Directory where screenshots are saved.";
        };
      };

      # ------------------------------------

      config = {

        preferences.aptPackages = [
          "grim"
          "jq"
          "rofi"
          "satty"
          "slurp"
          "wl-clipboard"
        ];

        preferences.pacmanPackages = [
          "grim"
          "jq"
          "rofi"
          "satty"
          "slurp"
          "wl-clipboard"
        ];

        home.packages = with pkgs; [
          wayfreeze
        ];

        home.sessionVariables.SCREENSHOT_DIR = config.preferences.screenshot.dir;

        home.file = {
          ".local/bin/screenshot" = {
            source = ./dotfiles/.local/bin/screenshot;
            executable = true;
          };
        };

      };

    };
}
