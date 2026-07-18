{
  flake.homeModules.arch =
    { config, lib, ... }:
    let
      packages = config.preferences.pacmanPackages;
    in
    {
      preferences.distro = "arch";

      preferences.pacmanPackages = [
        "pacman-contrib"
        "reflector"
      ];

      preferences.zsh.aliasesExtra = {
        cache = "sudo paccache -r -k 2";
        clean = "sudo pacman -Rns $(pacman -Qdtq) ; \
        nix-env --delete-generations +5 --profile ${config.xdg.stateHome}/nix/profiles/home-manager && \
        nix-collect-garbage && nix-store --optimise";
        install = "sudo pacman -S --needed";
        remove = "sudo pacman -Rns";
        switch = "nix run nixpkgs#home-manager -- switch --flake .#$HOST";
        update = "trizen -Syyu --devel --needed && nix flake update && switch";
        update_mirrorlist = "sudo rm -f /etc/pacman.d/mirrorlist.pacnew && \
        sudo reflector --latest 100 --protocol https --sort rate --save /etc/pacman.d/mirrorlist";
      };

      home.activation.pacmanPackages = ''
        declpac="${config.xdg.configHome}/declpac"
        printf '%s\n' "${lib.concatStringsSep "\n" packages}" > $declpac
        _i "Pacman state file written to $declpac"
      '';

    };
}
