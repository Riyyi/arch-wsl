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

      preferences.aptPackages = [
        "keepassxc"
        "mono-complete"
      ];

      preferences.pacmanPackages = [
        "aspnet-runtime"
        "aspnet-targeting-pack"
        "dive"
        "docker"
        "docker-buildx"
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
      home.packages =
        with pkgs;
        [
          antares
          postman
        ]
        ++ lib.optionals (config.preferences.distro == "ubuntu") [
          docker
          docker-buildx
          docker-compose
          dotnetCorePackages.sdk_10_0
          dive
          lazydocker
          # nodejs_24 # installed via nvm, non-deterministically
          omnisharp-roslyn
          opencode
          pnpm
          typescript-language-server
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

      home.activation.docker =
        let
          service = "docker.service";
        in
        lib.hm.dag.entryAfter [ "pacmanPackages" "aptPackages" ] (
          if config.preferences.distro == "ubuntu" then
            ''
              UNIT_SRC="${
                pkgs.writeText "${service}" ''
                  [Unit]
                  Description=Docker Application Container Engine
                  Documentation=https://docs.docker.com
                  After=network-online.target
                  Wants=network-online.target

                  [Service]
                  Type=notify
                  ExecStart=${pkgs.docker}/bin/dockerd
                  ExecReload=/bin/kill -s HUP $MAINPID
                  TimeoutStartSec=0
                  RestartSec=2
                  Restart=always
                  LimitNOFILE=infinity
                  LimitNPROC=infinity
                  LimitCORE=infinity
                  Delegate=yes
                  KillMode=process
                  OOMScoreAdjust=-500

                  [Install]
                  WantedBy=multi-user.target
                ''
              }"

              /bin/sudo cp "$UNIT_SRC" /etc/systemd/system/${service}
              /bin/sudo systemctl daemon-reload
              /bin/sudo systemctl enable --now ${service}
            ''
          else
            ''
              if test -x /bin/docker > /dev/null 2>&1; then
                  /bin/sudo systemctl enable --now docker.service
              else
                  _iError "Package not installed, skipping 'docker'"
              fi
            ''
        );

    };
}
