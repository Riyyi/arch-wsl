{
  flake.homeModules.ubuntu =
    { config, lib, ... }:
    let
      packages = config.preferences.aptPackages;

      # Ubuntu 24.04 restricts unprivileged user namespace creation via
      # AppArmor by default (kernel.apparmor_restrict_unprivileged_userns=1).
      # This breaks bwrap sandboxes built by Nix (e.g. vscode-fhs), which
      # have no AppArmor profile and are otherwise unconfined. Grant just
      # the Nix-built bwrap binaries a userns exception instead of
      # disabling the restriction system-wide.
      bwrapAppArmorProfile = ''
        abi <abi/4.0>,
        include <tunables/global>

        profile nix-bwrap /nix/store/*-bubblewrap-*/bin/bwrap flags=(unconfined) {
          userns,

          include if exists <local/nix-bwrap>
        }
      '';
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

      home.activation.bwrapAppArmor = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
        profile=/etc/apparmor.d/nix-bwrap
        new_profile="$(mktemp)"
        printf '%s' ${lib.escapeShellArg bwrapAppArmorProfile} > "$new_profile"
        if ! cmp -s "$new_profile" "$profile" 2>/dev/null; then
          /bin/sudo cp "$new_profile" "$profile"
          /bin/sudo apparmor_parser -r "$profile"
        fi
        rm -f "$new_profile"
      '';

    };
}
