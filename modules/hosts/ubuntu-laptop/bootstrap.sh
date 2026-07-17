#!/bin/sh

# The following is installed externally:

# PPA's added
# /etc/apt/sources.list.d
# - claude-destkop.list
# - microsoft-prod.list
# - vscode.sources

# Installed from PPA
# - claude-desktop
# - code (VS Code)
# - mdatp (Microsoft Defender)

# Others, these will never get updated
# - dotnet
#   https://dot.net/v1/dotnet-install.sh --channel 10.0
# - node (nvm)
#   https://nodejs.org/en/download

# Create .NET dev cert
dotnet dev-certs https --trust # this needs to run after installing libnss3-tools!

gsettings set org.gnome.desktop.wm.preferences resize-with-right-button true
gsettings set org.gnome.desktop.input-sources xkb-options "['caps:swapescape']"

# Conflicts with manually binding super+<num>
gsettings set org.gnome.shell.extensions.dash-to-dock hot-keys false

# Remap super -> super+d for Activities Overview page
gsettings set org.gnome.mutter overlay-key ''
gsettings set org.gnome.shell.keybindings toggle-overview "['<Super>d']"
