{
  flake.homeModules.systemdUserUnits =
    {
      config,
      lib,
      ...
    }:
    {

      # ---------------------------------------------------------------------------
      # Make systemd --user pick up unit files that ship in the home-manager
      # (nix) profile at ~/.nix-profile/share/systemd/user/.
      #
      # Background:
      #   * home-manager on non-NixOS sets `targets.genericLinux.enable = true`,
      #     which adds ~/.nix-profile/share to XDG_DATA_DIRS. The desktop
      #     environment uses XDG_DATA_DIRS to discover .desktop entries, so apps
      #     installed via home-manager show up in the app launcher just fine
      #     (XDG_DATA_DIRS is honoured by GNOME Shell, nautilus, etc).
      #   * However, `systemd --user` does NOT read XDG_DATA_DIRS. It searches
      #     a fixed `UnitPath` that it captured at session start. You can check
      #     the effective search path with:
      #
      #         systemctl --user show -p UnitPath
      #
      #     On a typical Ubuntu 24.04 session that path includes
      #     ~/.config/systemd/user, /etc/xdg/systemd/user, /usr/.../systemd/user
      #     and a few runtime dirs, but NOT ~/.nix-profile/share/systemd/user.
      #
      # Consequence:
      #   * DBus-activated apps whose .desktop has
      #         SystemdService=app-<id>.service
      #     (e.g. ghostty, with `DBusActivatable=true`) fail with
      #     "Unit app-<id>.service not found" when launched from GNOME Search,
      #     even though launching the binary directly works.
      #
      # Fix:
      #   * Mirror every unit shipped in the nix profile into
      #     ~/.config/systemd/user/ (which is always in UnitPath) and reload
      #     systemd --user. Runs on every `home-manager switch`.
      # ---------------------------------------------------------------------------

      home.activation.linkNixSystemdUserUnits = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
        unitsDir="${config.xdg.configHome}/systemd/user"
        mkdir -p "$unitsDir"
        src="$HOME/.nix-profile/share/systemd/user"

        # Drop dead symlinks (units removed from the profile) before creating
        # new ones, so we don't race with or overwrite Home Manager-managed units.
        find "$unitsDir" -maxdepth 1 -xtype l -delete >/dev/null 2>&1 || true

        shopt -s nullglob
        for unit in \
          "$src"/*.service \
          "$src"/*.socket \
          "$src"/*.timer \
          "$src"/*.target \
          "$src"/*.path
        do
          name="''${unit##*/}"
          if [[ ! -e "$unitsDir/$name" ]]; then
            ln -s "$unit" "$unitsDir/$name"
          fi
        done
        shopt -u nullglob

        systemctl --user daemon-reload >/dev/null 2>&1 || true
      '';

    };
}
