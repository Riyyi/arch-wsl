{
  flake.homeModules.work = { pkgs, ... }: {

    home.packages = with pkgs; [
      onedrive
      onedrivegui
    ];

  };
}
