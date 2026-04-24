$ powershell -ExecutionPolicy Bypass -File .\bootstrap.ps1

$ nix run nixpkgs#home-manager -- switch --flake .#arch-wsl


to hide niri cursor
- create empty cursor theme via
  https://github.com/celly/transparent-xcursor
- set config.kdl to this theme
- set XCURSOR_THEME to a random value of a theme that doesnt exist

to hide windows cursor:
- rename /usr/share/icons/default to default2
- set XCURSOR_THEME=default
- set cursor to existing theme in config.kdl, to get that theme