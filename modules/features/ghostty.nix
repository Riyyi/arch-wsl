{
  flake.homeModules.ghostty = {

    preferences.pacmanPackages = [
      "ghostty"
    ];

    programs.ghostty = {
      enable = true;
      package = null; # nixpkg doesnt work in WSL
      systemd.enable = false; # doesnt work in combination with package=null
      settings = {
        app-notifications = "no-clipboard-copy";
        confirm-close-surface = false;
        copy-on-select = "clipboard";
        cursor-style-blink = false;
        font-family = "DejaVuSansM Nerd Font Mono";
        font-feature = "-calt, -liga, -dlig"; # disable ligatures
        font-size = 10;
        link-url = true;
        macos-titlebar-style = "hidden";
        selection-foreground = "cell-foreground";
        shell-integration-features = "no-cursor";
        term = "xterm-256color";
        theme = "noctalia";
        window-decoration = true;
        window-inherit-working-directory = true;

        keybind = [
          "super+d=unbind"
          "super+t=unbind"
          "super+w=unbind"

          # Neovim fixes:

          # forward command + backtick the <C-6> (Ctrl-^) sequence
          "super+grave_accent=text:\\x1E"
          # make command + h work
          "unconsumed:super+h=text:h"
        ];
      };
    };
  };
}
