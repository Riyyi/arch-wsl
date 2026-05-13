{ self, ... }:
{
  flake.homeModules.development =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    let
      dotfiles = config.preferences.path.dotfiles;

      # Calculate the subdirectory directory from root this module is in
      subDir = self.lib.subDir __curPos;

      files = [
        ".config/opencode/themes/base16-tomorrow-night.json"
      ];
    in
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
        "opencode"
        "typescript-language-server"
      ];

      # Prefer nixpkgs over AUR, where possible (OpenGL)
      home.packages = with pkgs; [
        antares
        postman
      ];

      home.file =
        builtins.listToAttrs (
          map (file: {
            name = "${file}";
            value = {
              source = ./dotfiles + "/${file}";
            };
          }) files
        )
        // {
          # Do not link from the Nix store, so it remains writable
          ".local/state/opencode/kv.json".source =
            config.lib.file.mkOutOfStoreSymlink "${dotfiles}/${subDir}/dotfiles/.local/state/opencode/kv.json";
        };

      home.activation.docker = lib.hm.dag.entryAfter [ "pacmanPackages" ] ''
        if test -x /bin/docker > /dev/null 2>&1; then
            /bin/sudo systemctl enable --now docker.service
        else
            _iError "Package not installed, skipping 'docker'"
        fi
      '';

    };
}
