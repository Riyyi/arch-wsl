{
  flake.homeModules.awesome =
    let
      files = [
        ".config/awesome/rc.lua"
        ".config/awesome/config/app-launcher.lua"
        ".config/awesome/config/error.lua"
        ".config/awesome/config/keybind-functions.lua"
        ".config/awesome/config/keybinds.lua"
        ".config/awesome/config/menu.lua"
        ".config/awesome/config/rules.lua"
        ".config/awesome/config/signals.lua"
        ".config/awesome/config/variables.lua"
        ".config/awesome/config/wibar.lua"
        ".config/awesome/themes/noctalia/theme.lua"
        ".config/X11/Xresources"
      ];
    in
    {

      preferences.aptPackages = [
        "awesome"
      ];

      preferences.pacmanPackages = [
        "awesome"
      ];

      home.file = builtins.listToAttrs (
        map (file: {
          name = "${file}";
          value = {
            source = ./dotfiles + "/${file}";
          };
        }) files
      );

    };
}
