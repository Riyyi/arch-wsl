{
  flake.homeModules.ubuntu =
    { config, lib, ... }:
    let
      packages = config.preferences.aptPackages;
    in
    {
      preferences.distro = "ubuntu";

      preferences.aptPackages = [
      ];

      preferences.shell.aliases = {
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

    };
}
