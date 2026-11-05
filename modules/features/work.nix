{
  flake.homeModules.work = { pkgs, ... }: {

    home.packages = with pkgs; [
      unstable.onedrive
      unstable.onedrivegui
    ];

  };
}
