{
  flake.homeModules.docker =
    { lib, ... }:
    {

      preferences.pacmanPackages = [
        "docker"
        "docker-compose"
        "lazydocker"
      ];

      home.activation.docker = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
        /bin/sudo systemctl enable --now docker.service
      '';

    };
}
