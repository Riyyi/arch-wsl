{
  flake.homeModules.sound = {

    preferences.pacmanPackages = [
      "pipewire"
      "pipewire-alsa"
      "pipewire-jack"
      "pipewire-pulse"
    ];

  };
}
