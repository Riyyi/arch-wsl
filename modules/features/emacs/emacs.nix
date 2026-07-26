{
  flake.homeModules.emacs =
    { lib, pkgs, ... }:
    let
      recursiveListFiles =
        dir:
        lib.flatten (
          lib.mapAttrsToList (
            name: type:
            if type == "directory" then
              lib.map (subfile: "${name}/${subfile}") (recursiveListFiles "${dir}/${name}")
            else
              [ name ]
          ) (builtins.readDir dir)
        );
      files = recursiveListFiles ./dotfiles;
    in
    {

      preferences.aptPackages = [
        "emacs"
        "hunspell"
        "hunspell-en-us"
        "hunspell-nl"
      ];

      preferences.pacmanPackages = [
        "emacs"
        "hunspell"
        "hunspell-en_us"
        "hunspell-nl"
      ];

      # These packages arent available the the official repos
      home.packages = with pkgs; [
        nixd
        nixfmt
      ];

      home.file = builtins.listToAttrs (
        map (file: {
          name = "${file}";
          value = {
            source = ./dotfiles + "/${file}";
          };
        }) files
      );

    };
}
