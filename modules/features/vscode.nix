{
  flake.homeModules.vscode =
    {
      lib,
      ...
    }:
    {

      preferences.pacmanPackages = [
        "code"
      ];

      home.file = {
        ".vscode-oss/argv.json".text = builtins.toJSON {
          enable-crash-reporter = false;
          # https://code.visualstudio.com/docs/configure/settings-sync#_recommended-configure-the-keyring-to-use-with-vs-code
          password-store = "gnome-libsecret"; # make gnome-keyring work
        };
        ".config/Code - OSS/User/settings.json".text = builtins.toJSON {
          editor.cursorBlinking = "solid";
          editor.rulers = [ 80 ];
          editor.trimWhitespaceOnDelete = true;
          files.insertFinalNewline = true;
          files.trimFinalNewlines = true;
          files.trimTrailingWhitespace = true;
          gitlens.ai.model = "vscode";
          gitlens.ai.vscode.model = "copilot:claude-haiku-4.5";
          vim.useSystemClipboard = true;
          workbench.colorTheme = "Tomorrow Night";
        };
      };

      home.activation.vscodeExtensions = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
        PATH_TMP="$PATH"
        PATH="$PATH:/usr/bin:/usr/sbin"

        install_ext() {
          local id=$1 ver=''${2:-""}
          code --list-extensions --show-versions \
            | grep -qi "^''${id}''${ver}" || code --install-extension "''${id}''${ver}" --force
        }

        install_ext "antfu.goto-alias"
        install_ext "antfu.iconify"
        install_ext "bradlc.vscode-tailwindcss"
        install_ext "dbaeumer.vscode-eslint"
        install_ext "eamodio.gitlens"
        install_ext "firefox-devtools.vscode-firefox-debug"
        #install_ext "GitHub.copilot-chat" # this is built-in
        install_ext "ms-vscode.Theme-TomorrowKit"
        install_ext "Nuxt.mdc"
        install_ext "Nuxtr.nuxtr-vscode"
        install_ext "pbkit.vscode-pbkit"
        install_ext "takumiI.markdowntable"
        install_ext "vscodevim.vim"
        install_ext "vue.volar"

        PATH="$PATH_TMP"
        unset PATH_TMP
        unset install_ext
      '';

    };
}
