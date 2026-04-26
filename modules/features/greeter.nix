{
  flake.homeModules.greeter =
    { lib, ... }:
    {

      preferences.pacmanPackages = [
        "ly"
      ];

      home.file = {
        ".config/ly/config.ini".text = lib.generators.toKeyValue { } {
          default_input = "password";
          clear_password = true;

          animation = "matrix";

          bigclock = "en";
          bigclock_12h = true;

          hide_version_string = true;

          ly_log = "/var/log/ly.log";
          session_log = ".local/state/ly-session.log";
        };
      };

      # TODO:
      # cp ~/.config/ly/config.ini /etc/ly/config.ini

    };
}
