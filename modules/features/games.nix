{
  flake.homeModules.games = {

    preferences.aptPackages = [
      "steam"
      "steam-installer"
    ];

    preferences.pacmanPackages = [
      "steam"
    ];

  };
}
