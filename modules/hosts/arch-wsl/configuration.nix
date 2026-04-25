{ self, inputs, ... }:
{

  flake.homeConfigurations.arch-wsl = inputs.home-manager.lib.homeManagerConfiguration {
    pkgs = import inputs.nixpkgs { system = "x86_64-linux"; };

    modules = [
      self.homeModules.hostArchWsl
    ];
  };

  flake.homeModules.hostArchWsl =

    {
      config,
      lib,
      pkgs,
      ...
    }:

    let
      user = config.preferences.user.name;
      home = config.preferences.user.home;
      packages = config.preferences.pacmanPackages;
    in

    {
      imports = [

        self.modules.generic.base
        self.modules.generic.general

        self.homeModules.nix
        self.homeModules.keyring

        self.homeModules.ghostty
        self.homeModules.git
        self.homeModules.niri
        self.homeModules.noctalia
        self.homeModules.nvim
        self.homeModules.vscode
        self.homeModules.zsh

        {
          preferences.pacmanPackages = [
            "base"
            "base-devel"
            "declpac-git"
            #"egl-wayland"
            "fastfetch"
            "fzf"
            "gcc"
            "ghostty"
            "git"
            "glibc"
            "go"
            "less"
            "libgcc"
            "make"
            "man-db"
            "mesa"
            "opencode"
            "neovim"
            "sudo"
            "tree"
            "tree-sitter"
            "trizen"
            "ttf-dejavu"
            "ttf-dejavu-nerd"
            "vulkan-dzn"
            "vulkan-icd-loader"
            "wayland"
            "xwayland-satellite"
            "cowsay"

            #noctalia-shell deps
            "imagemagick"
            "brightnessctl"
            "qt6-multimedia"
            "wlr-randr"
            "noctalia-qs" # NOTE: put before noctalia-shell!
            "noctalia-shell"
          ];

          home.username = user;
          home.homeDirectory = home;

          xdg.enable = true;

          home.packages = with pkgs; [
            ncdu
            #ghostty
            kdePackages.konsole
            #self.packages.${pkgs.stdenv.hostPlatform.system}.niri
            #self.packages.${pkgs.stdenv.hostPlatform.system}.noctalia-shell
          ];

          home.stateVersion = "25.11";

        }
      ];

      home.activation.pacmanPackages = ''
        printf '%s\n' "${lib.concatStringsSep "\n" packages}" > ''${XDG_CACHE_HOME:-~/.cache}/declpac
      '';

    };

}
