{
  flake.homeModules.greeter =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    {

      preferences.aptPackages = [
      ];

      preferences.pacmanPackages = [
        "ly"
      ];

      home.packages =
        with pkgs;
        [ ]
        ++ lib.optionals (config.preferences.distro == "ubuntu") [
          ly
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

            waylandsessions = "/usr/share/wayland-sessions:${config.preferences.user.home}/.local/share/wayland-sessions";

            ly_log = "/var/log/ly.log";
            session_log = ".local/state/ly-session.log";
          };
        in
        # Enabele ly on TTY1 and deploy its config
        lib.hm.dag.entryAfter [ "pacmanPackages" "aptPackages" ] ''
          if test -x /bin/ly-dm || test -x /bin/ly; then
              /bin/sudo systemctl enable --now ly@tty1.service
              /bin/sudo systemctl disable getty@tty1.service
          else
              _iError "Package not installed, skipping 'ly'"
          fi

          /bin/sudo mkdir -p /etc/ly
          printf '%s' '${lyConfig}' | /bin/sudo tee /etc/ly/config.ini > /dev/null
        '';

    };
}
