{
  flake.homeModules.docker = {

    preferences.pacmanPackages = [
      "docker"
      "docker-compose"
      "lazydocker"
    ];

    #TODO:
    # systemctl enable docker.service

  };
}
