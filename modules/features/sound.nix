{
  flake.homeModules.sound = {

    preferences.aptPackages = [
      "pipewire"
      "pipewire-alsa"
      "pipewire-jack"
      "pipewire-pulse"
    ];

    preferences.pacmanPackages = [
      "pipewire"
      "pipewire-alsa"
      "pipewire-jack"
      "pipewire-pulse"
    ];

  };
}
