{
  description = "NixOS configuration";

  nixConfig = {
    extra-experimental-features = [ "pipe-operators" ];
  };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-neovim-pinned.url = "github:nixos/nixpkgs/26f4107e47e3ad0ffd0db220469ba83b6f6d96e8";

    flake-parts.url = "github:hercules-ci/flake-parts";

    firefox-addons.url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
    firefox-addons.inputs.nixpkgs.follows = "nixpkgs";

    home-manager.url = "github:nix-community/home-manager/release-26.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    sops-nix.url = "github:Mic92/sops-nix";
    sops-nix.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    inputs:
    let
      inherit (inputs.nixpkgs) lib;
      import-tree =
        path:
        path
        |> lib.fileset.fileFilter (file: file.hasExt "nix" && !(lib.hasPrefix "_" file.name))
        |> lib.fileset.toList;

      inherit (inputs.self) outputs;
    in
    inputs.flake-parts.lib.mkFlake { inherit inputs; } {
      imports = import-tree ./modules;

      _module.args.outputs = outputs;
      _module.args.rootPath = ./.;
    };
}
