{
  flake.homeModules.sound = {

    preferences.dnfPackages = [
      "pipewire"
      "pipewire-alsa"
      "pipewire-plugin-jack"
      "pipewire-pulseaudio"
    ];

    preferences.pacmanPackages = [
      "pipewire"
      "pipewire-alsa"
      "pipewire-jack"
      "pipewire-pulse"
    ];

  };
}
