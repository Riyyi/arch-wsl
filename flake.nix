{
  description = "NixOS configuration";

  nixConfig = {
    extra-experimental-features = [ "pipe-operators" ];
  };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    flake-parts.url = "github:hercules-ci/flake-parts";

    wrappers.url = "github:Lassulus/wrappers";
    wrapper-modules.url = "github:BirdeeHub/nix-wrapper-modules";

    firefox-addons.url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
    firefox-addons.inputs.nixpkgs.follows = "nixpkgs";

    home-manager.url = "github:nix-community/home-manager/release-25.11";
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
