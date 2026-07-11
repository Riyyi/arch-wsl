{
  flake.homeModules.keyring = {

    preferences.aptPackages = [
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
