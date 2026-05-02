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

      home.activation.docker = lib.hm.dag.entryAfter [ "pacmanPackages" ] ''
        if test -x /bin/docker > /dev/null 2>&1; then
            /bin/sudo systemctl enable --now docker.service
        else
            _iError "Package not installed, skipping 'docker'"
        fi
      '';

    };
}
