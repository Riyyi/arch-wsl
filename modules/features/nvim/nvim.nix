{ self, ... }:
{
  flake.homeModules.nvim =
    {
      config,
      pkgs,
      ...
    }:
    let
      dotfiles = config.preferences.path.dotfiles;

      # Calculate the subdirectory directory from root this module is in
      subDir = self.lib.subDir __curPos;

      files = [
        "init.lua"
        #"lazy-lock.json"

        "after/ftplugin/lua.lua"

        "lua/core/autocommands.lua"
        "lua/core/buffers.lua"
        "lua/core/config.lua"
        "lua/core/filetypes.lua"
        "lua/core/functions.lua"
        "lua/core/globals.lua"
        "lua/core/leader-key.lua"

        "lua/core.lua"
        "lua/development.lua"
        "lua/editor.lua"
        "lua/git.lua"
        "lua/keybind-functions.lua"
        "lua/keybinds.lua"
        "lua/packages.lua"
        "lua/selection.lua"
        "lua/terminal.lua"
        "lua/ui.lua"
      ];
    in
    {

      # Some additional packages needed for fzf compilation
      preferences.pacmanPackages = [
        "fzf"
        "gcc"
        "make"
        "libgcc"
        "neovim"
        "sqlite"
        "tree-sitter"
      ];

      # These packages arent available the the official repos
      home.packages = with pkgs; [
        nixd
        nixfmt
      ];

      home.file =
        builtins.listToAttrs (
          map (file: {
            name = ".config/nvim/${file}";
            value = {
              source = ./dotfiles + "/${file}";
            };
          }) files
        )
        // {
          # lazy-lock.json wont be linked from Nix store, so it remains writable
          ".config/nvim/lazy-lock.json".source =
            config.lib.file.mkOutOfStoreSymlink "${dotfiles}/${subDir}/dotfiles/lazy-lock.json";

          # Used for nvim config testing
          ".config/nvim-dev".source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/${subDir}/dotfiles";
        };

    };
}
