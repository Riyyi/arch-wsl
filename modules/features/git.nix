{
  flake.homeModules.git =
    { config, pkgs, ... }:
    {

      preferences.pacmanPackages = [
        "git"
      ];

      programs.git = {
        enable = true;
        package = pkgs.emptyDirectory; # required by module, but we use pacman
        settings = {
          user = {
            name = "${config.preferences.user.git.name}";
            email = "${config.preferences.user.git.email}";
          };
          core = {
            pager = "less -x 1,5";
          };
          init = {
            defaultBranch = "master";
          };
        };
      };

    };
}
