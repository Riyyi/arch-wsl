{
  flake.homeModules.keyring = {

    preferences.aptPackages = [
      "libsecret-1-0"
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
