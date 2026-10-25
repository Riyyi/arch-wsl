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
        "lazy-lock.json"

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

      sqliteLib = "${pkgs.sqlite.out}/lib/libsqlite3${pkgs.stdenv.hostPlatform.extensions.sharedLibrary}";
    in
    {

      preferences.aptPackages = [
        "fzf"
        "gcc"
        "make"
        "libgcc-s1"
        "sqlite3"
      ];

      # Some additional packages needed for fzf compilation
      preferences.pacmanPackages = [
        "fzf"
        "gcc"
        "make"
        "libgcc"
        "lua-language-server"
        "sqlite"
        "tree-sitter"
        "tree-sitter-cli"
      ];

      # These packages arent available the the official repos
      home.packages =
        with pkgs;
        [
          neovim-pinned.neovim
          nixd
          nixfmt
          sqlite
        ]
        ++ lib.optionals (config.preferences.distro == "ubuntu") [
          git # Ubuntu 24.04 ships old git 2.43, which doesnt have the --no-advice flag
          lua-language-server
          tree-sitter # also too old
        ];

      home.file =
        builtins.listToAttrs (
          map (file: {
            name = ".config/nvim/${file}";
            value = {
              # Not linked from Nix store, so it remains writable
              source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/${subDir}/dotfiles/${file}";
            };
          }) files
        )
        // {
          ".config/nvim/lua/nix.lua".text = ''
            vim.g.sqlite_clib_path = "${sqliteLib}" -- use Nix sqlite
          '';
        };

    };
}
