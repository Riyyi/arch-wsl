{
  flake.homeModules.ubuntu =
    { config, lib, ... }:
    let
      packages = config.preferences.aptPackages;

      # Ubuntu 24.04 restricts unprivileged user namespace creation via
      # AppArmor by default (kernel.apparmor_restrict_unprivileged_userns=1).
      # This breaks otherwise-unconfined Nix-built binaries that rely on
      # user namespaces instead of disabling the restriction system-wide;
      # grant each one a scoped userns exception.
      #
      # - bwrap: used by bwrap-based sandboxes (e.g. vscode-fhs).
      # - postman: Electron's chrome-sandbox SUID helper can never be a
      #   real setuid-root binary (Nix builds can't chown to root), so
      #   Chromium finds it misconfigured and aborts instead of falling
      #   back to the unprivileged-userns sandbox on its own.
      apparmorProfiles = {
        nix-bwrap = ''
          abi <abi/4.0>,
          include <tunables/global>

          profile nix-bwrap /nix/store/*-bubblewrap-*/bin/bwrap flags=(unconfined) {
            userns,

            include if exists <local/nix-bwrap>
          }
        '';
        nix-postman = ''
          abi <abi/4.0>,
          include <tunables/global>

          profile nix-postman /nix/store/*-postman-*/share/postman/postman flags=(unconfined) {
            userns,

            include if exists <local/nix-postman>
          }
        '';
      };
    in
    {
      preferences.distro = "ubuntu";

      preferences.aptPackages = [
      ];

      preferences.zsh.aliasesExtra = {
        clean = "sudo apt autoremove ; \
        nix-env --delete-generations +5 --profile ${config.xdg.stateHome}/nix/profiles/home-manager && \
        nix-collect-garbage && nix-store --optimise";
        install = "sudo apt install";
        remove = "sudo apt remove";
        switch = "nix run nixpkgs#home-manager -- switch --flake .#$HOST";
        update = "sudo apt update && sudo apt upgrade && nix flake update && switch";
      };

      home.activation.aptPackages = ''
        declpac="${config.xdg.configHome}/declpac"
        printf '%s\n' "${lib.concatStringsSep "\n" packages}" > $declpac
        _i "APT state file written to $declpac"
      '';

      home.activation.nixAppArmorProfiles = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
        ${lib.concatStringsSep "\n" (
          lib.mapAttrsToList (name: content: ''
            profile=/etc/apparmor.d/${name}
            new_profile="$(mktemp)"
            printf '%s' ${lib.escapeShellArg content} > "$new_profile"
            if ! cmp -s "$new_profile" "$profile" 2>/dev/null; then
              /bin/sudo cp "$new_profile" "$profile"
              /bin/sudo apparmor_parser -r "$profile"
            fi
            rm -f "$new_profile"
          '') apparmorProfiles
        )}
      '';

    };
}
