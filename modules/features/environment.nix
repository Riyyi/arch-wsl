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
        "less"
        "libgcc"
        "linux"
        "linux-firmware"
        "man-db"
        "man-pages"
        "ncdu"
        "neovim"
        "opencode"
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
