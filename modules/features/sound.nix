{
  flake.homeModules.sound = {

    preferences.aptPackages = [
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
