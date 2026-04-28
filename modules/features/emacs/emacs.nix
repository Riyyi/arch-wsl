{
  flake.homeModules.emacs =
    { lib, ... }:
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

      # Some additional packages needed for fzf compilation
      preferences.pacmanPackages = [
        "emacs"
        "hunspell"
        "hunspell-en_us"
        "hunspell-nl"
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
