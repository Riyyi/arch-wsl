{
  flake.homeModules.vscode =
    {
      lib,
      ...
    }:
    {

      preferences.pacmanPackages = [
        "visual-studio-code-bin"
      ];

      home.file = {
        ".vscode/argv.json".text = builtins.toJSON {
          enable-crash-reporter = false;
          # https://code.visualstudio.com/docs/configure/settings-sync#_recommended-configure-the-keyring-to-use-with-vs-code
          password-store = "gnome-libsecret"; # make gnome-keyring work
        };

        ".config/Code/User/keybindings.json".text = builtins.toJSON [
          {
            key = "alt+w";
            command = "workbench.action.closeActiveEditor";
          }
        ];

        ".config/Code/User/settings.json".text = builtins.toJSON {
          editor.cursorBlinking = "solid";
          editor.formatOnSave = true;
          editor.rulers = [ 80 ];
          editor.trimWhitespaceOnDelete = true;
          files.insertFinalNewline = true;
          files.trimFinalNewlines = true;
          files.trimTrailingWhitespace = true;
          gitlens.ai.model = "vscode";
          gitlens.ai.vscode.model = "copilot:claude-haiku-4.5";
          omnisharp.path = "/usr/bin/omnisharp";
          omnisharp.waitForDebugger = true;
          vim.leader = "<space>";
          vim.normalModeKeyBindingsNonRecursive = [
            {
              before = [
                "<leader>"
                " "
              ];
              commands = [ "workbench.action.showCommands" ];
            }
            {
              before = [
                "<leader>"
                ","
              ];
              commands = [ "workbench.action.tasks.runTask" ];
            }
            {
              before = [
                "<leader>"
                "c"
                "c"
              ];
              commands = [ "editor.action.commentLine" ];
            }
            {
              before = [
                "<leader>"
                "f"
                "f"
              ];
              commands = [ "workbench.action.quickOpen" ];
            }
            {
              before = [
                "<leader>"
                "f"
                "s"
              ];
              commands = [ "workbench.action.files.save" ];
            }
            {
              before = [
                "<leader>"
                "w"
                "m"
              ];
              commands = [ "markdown.showPreviewToSide" ];
            }
            {
              before = [
                "<leader>"
                "w"
                "q"
              ];
              commands = [ "workbench.action.closeActiveEditor" ];
            }
            {
              before = [
                "<leader>"
                "w"
                "M"
              ];
              commands = [ "markdown.showPreview" ];
            }
          ];

          vim.visualModeKeyBindingsNonRecursive = [
            {
              before = [
                "<leader>"
                "c"
                "c"
              ];
              commands = [ "editor.action.commentLine" ];
            }
          ];

          vim.useSystemClipboard = true;
          workbench.colorTheme = "Tomorrow Night";
          workbench.editor.wrapTabs = true;
        };
      };

      home.activation.vscodeExtensions = lib.hm.dag.entryAfter [ "pacmanPackages" ] ''
        if test -x /bin/code > /dev/null 2>&1; then
            install_ext() {
              local id=$1 ver=''${2:-""}
              /bin/code --list-extensions --show-versions \
                  | grep -qi "^''${id}''${ver}" || /bin/code --install-extension "''${id}''${ver}" --force
            }

            install_ext "antfu.goto-alias"
            install_ext "antfu.iconify"
            install_ext "bradlc.vscode-tailwindcss"
            install_ext "dbaeumer.vscode-eslint"
            install_ext "eamodio.gitlens"
            install_ext "firefox-devtools.vscode-firefox-debug"
            #install_ext "GitHub.copilot-chat" # this is built-in
            install_ext "ms-dotnettools.csharp"
            install_ext "ms-dotnettools.csdevkit"
            install_ext "ms-vscode.Theme-TomorrowKit"
            install_ext "Nuxt.mdc"
            install_ext "Nuxtr.nuxtr-vscode"
            install_ext "pbkit.vscode-pbkit"
            install_ext "takumiI.markdowntable"
            install_ext "vscodevim.vim"
            install_ext "vue.volar"

            unset install_ext
        else
            _iError "Package not installed, skipping 'vscode'"
        fi
      '';

    };
}
