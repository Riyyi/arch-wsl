{
  flake.homeModules.greeter =
    { lib, ... }:
    {

      preferences.pacmanPackages = [
        "ly"
      ];

      home.activation.greeter =
        let
          lyConfig = lib.generators.toKeyValue { } {
            default_input = "password";
            clear_password = true;

            animation = "matrix";

            bigclock = "en";
            bigclock_12h = true;

            hide_version_string = true;

            ly_log = "/var/log/ly.log";
            session_log = ".local/state/ly-session.log";
          };
        in
        # Enabele ly on TTY1 and deploy its config
        lib.hm.dag.entryAfter [ "writeBoundary" ] ''
          /bin/sudo systemctl enable --now ly@tty1.service
          /bin/sudo systemctl disable getty@tty1.service

          /bin/sudo mkdir -p /etc/ly
          printf '%s' "${lyConfig}" | /bin/sudo tee /etc/ly/config.ini > /dev/null
        '';

    };
}
