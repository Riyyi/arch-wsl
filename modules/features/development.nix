{
  flake.homeModules.development =
    { lib, pkgs, ... }:
    {

      preferences.pacmanPackages = [
        "aspnet-runtime"
        "aspnet-targeting-pack"
        "docker"
        "docker-compose"
        "dotnet-sdk"
        "keepassxc"
        "lazydocker"
        "mono-msbuild"
        "npm"
        "omnisharp-roslyn-bin"
        "typescript-language-server"
      ];

      # Prefer nixpkgs over AUR, where possible (OpenGL)
      home.packages = with pkgs; [
        antares
        postman
      ];

      home.activation.docker = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
        /bin/sudo systemctl enable --now docker.service
      '';

    };
}
