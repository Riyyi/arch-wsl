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
      mkUsernsProfile = name: path: ''
        abi <abi/4.0>,
        include <tunables/global>

        profile ${name} ${path} flags=(unconfined) {
          userns,

          include if exists <local/${name}>
        }
      '';

      apparmorProfiles = {
        nix-bwrap = mkUsernsProfile "nix-bwrap" "/nix/store/*-bubblewrap-*/bin/bwrap";
        nix-chromium = mkUsernsProfile "nix-chromium" "/nix/store/*-chromium-unwrapped-*/libexec/chromium/chromium";
        nix-electron = mkUsernsProfile "nix-electron" "/nix/store/*-electron-unwrapped-*/libexec/electron/electron";
        nix-postman = mkUsernsProfile "nix-postman" "/nix/store/*-postman-*/share/postman/postman";
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
