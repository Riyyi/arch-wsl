{
  flake.homeModules.keyring = {

    preferences.dnfPackages = [
      "libsecret"
      "gnome-keyring"
      "gcr"
      "seahorse"
    ];

    preferences.pacmanPackages = [
      "libsecret"
      "gnome-keyring"
      "gcr"
      "seahorse"
    ];

  };
}
