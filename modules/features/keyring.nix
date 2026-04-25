{
  flake.homeModules.keyring = {

    preferences.pacmanPackages = [
      "libsecret"
      "gnome-keyring"
      "gcr"
      "seahorse"
    ];

  };
}
