{
  flake.homeModules.fedora =
    { config, lib, ... }:
    let
      packages = config.preferences.dnfPackages;
    in
    {
      preferences.distro = "fedora";

      preferences.dnfPackages = [
        "dnf-plugins-core"
      ];

      preferences.shell.aliases = {
        clean = "sudo dnf autoremove ; \
        nix-env --delete-generations +5 --profile ${config.xdg.stateHome}/nix/profiles/home-manager && \
        nix-collect-garbage && nix-store --optimise";
        install = "sudo dnf install";
        remove = "sudo dnf remove";
        switch = "nix run nixpkgs#home-manager -- switch --flake .#$HOST";
        update = "sudo dnf upgrade --refresh && nix flake update && switch";
      };

      home.activation.dnfPackages = ''
        declpac="${config.xdg.configHome}/declpac"
        printf '%s\n' "${lib.concatStringsSep "\n" packages}" > $declpac
        _i "DNF state file written to $declpac"
      '';

    };
}
