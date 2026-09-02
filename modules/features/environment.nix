{ self, ... }:
{
  flake.homeModules.environment =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    let
      selfpkgs = self.packages.${pkgs.stdenv.hostPlatform.system};
    in
    {

      imports = [
        self.homeModules.git
        self.homeModules.nvim
        self.homeModules.zsh
      ];

      preferences.aptPackages = [
        "cmake"
        "coreutils"
        # TODO: declpac
        "duf"
        "fzf"
        "git"
        "golang"
        "htop"
        "jq"
        "linux-generic"
        "less"
        "libgcc-s1"
        "linux-firmware"
        "man-db"
        "manpages"
        "ncdu"
        "neovim"
        "openssh-client"
        "openssh-server"
        "rsync"
        "sudo"
        "tree"
        "unrar"
        "unzip"
        "util-linux"
        "wget"
        "yt-dlp"
      ];

      preferences.pacmanPackages = [
        "base"
        "base-devel"
        "cmake"
        "coreutils"
        "declpac-git"
        "duf"
        "fastfetch"
        "fzf"
        "git"
        "go"
        "htop"
        "jq"
        "less"
        "libgcc"
        "linux"
        "linux-firmware"
        "man-db"
        "man-pages"
        "ncdu"
        "neovim"
        "openssh"
        "rsync"
        "sudo"
        "tokei"
        "tree"
        "tree-sitter"
        "trizen"
        "unrar"
        "unzip"
        "util-linux"
        "wget"
        "yt-dlp"
      ];

      home.packages =
        with pkgs;
        [ selfpkgs.ns ]
        ++ lib.optionals (config.preferences.distro == "ubuntu") [
          fastfetch
          tokei
          tree-sitter
        ];

    };
}
