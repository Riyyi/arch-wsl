{ self, ... }:
{
  flake.homeModules.environment =
    { pkgs, ... }:
    let
      selfpkgs = self.packages.${pkgs.stdenv.hostPlatform.system};
    in
    {

      imports = [
        self.homeModules.git
        self.homeModules.nvim
        self.homeModules.zsh
      ];

      preferences.dnfPackages = [
        "cmake"
        "coreutils"
        # TODO: declpac
        "duf"
        "fastfetch"
        "fzf"
        "git"
        "golang"
        "htop"
        "jq"
        "kernel"
        "less"
        "libgcc"
        "libtree-sitter"
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
        "util-linux"
        "wget1"
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
        "util-linux"
        "wget"
        "yt-dlp"
      ];

      home.packages = [
        selfpkgs.ns
      ];

    };
}
