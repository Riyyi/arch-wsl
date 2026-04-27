{
  flake.homeModules.arch =
    { config, ... }:
    {

      preferences.pacmanPackages = [
        "pacman-contrib"
        "reflector"
      ];

      preferences.shell.aliases = {
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

    };
}
