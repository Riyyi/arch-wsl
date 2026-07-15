{ self, inputs, ... }:
{

  flake.homeConfigurations.VLO-CAP-NC19 = inputs.home-manager.lib.homeManagerConfiguration {
    pkgs = import inputs.nixpkgs { system = "x86_64-linux"; };

    modules = [
      self.homeModules.hostUbuntuLaptop
    ];
  };

  flake.homeModules.hostUbuntuLaptop =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    let
      user = config.preferences.user.name;
      home = config.preferences.user.home;
    in
    {

      imports = [
        self.modules.generic.base

        self.homeModules.ubuntu
        self.homeModules.development
        self.homeModules.general
        self.homeModules.desktop

        {
          preferences.aptPackages = [
            "dhcpcd"
            "neovim"
            "network-manager"
            "network-manager-openconnect"
            "network-manager-gnome" # this is required for the password prompt
          ];

          # Improve home-manager on non-NixOS distros
          targets.genericLinux = {
            enable = true;
            gpu.enable = true;
          };

          home.username = user;
          home.homeDirectory = home;

          home.packages = with pkgs; [
            unstable.claude-code
            unstable.teams-for-linux
          ];

          xdg.enable = true;

          home.stateVersion = "25.11";

          home.activation.configuration = lib.hm.dag.entryAfter [ "aptPackages" ] ''
            /bin/sudo systemctl enable --now NetworkManager.service
          '';

          # Nix builds electron with a chrome-sandbox helper that needs to be
          # owned by root with the setuid bit set, otherwise electron apps
          # abort on launch. NixOS fixes this via security.wrappers, but we
          # are on generic Linux, so fix it up ourselves after each switch.
          home.activation.electron-sandbox = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
            while read -r sandbox; do
              owner_mode="$(stat -c '%U:%a' "$sandbox")"
              if [ "$owner_mode" != "root:4755" ]; then
                /bin/sudo chown root:root "$sandbox"
                /bin/sudo chmod 4755 "$sandbox"
              fi
            done < <(
              ${pkgs.nix}/bin/nix-store -qR ${pkgs.unstable.teams-for-linux} \
                | xargs -r find -maxdepth 4 -name chrome-sandbox -type f 2>/dev/null
            )
          '';

          sops.secrets.zshrc-extended = {
            # owner = user; # not available in home-manager standalone
            mode = "0550"; # add execute permissions
            sopsFile = ./../../features/sops/secrets/ubuntu-laptop/zshrc-extended.sh; # from
            key = "data"; # what
            path = "${home}/.config/zsh/.zshrc-extended"; # to
          };

        }
      ];

    };
}
