{ inputs, ... }:
{
  flake.homeModules.sops =
    { config, pkgs, ... }:
    let
      home = config.preferences.user.home;
    in
    {

      imports = [
        inputs.sops-nix.homeManagerModules.sops
      ];

      home.packages = with pkgs; [
        sops
        ssh-to-age
      ];

      sops.defaultSopsFile = ./secrets/secrets.yaml;
      sops.defaultSopsFormat = "yaml";
      sops.age.generateKey = false;
      sops.age.sshKeyPaths = [ "${home}/.ssh/id_ed25519" ];
      sops.gnupg.sshKeyPaths = [ ]; # do not import
      programs.zsh.profileExtra = inputs.nixpkgs.lib.mkAfter ''
        export SOPS_AGE_KEY_CMD="ssh-to-age -private-key -i ${home}/.ssh/id_ed25519"
      '';

    };
}
