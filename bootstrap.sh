#!/bin/sh

# References:
# - https://gist.github.com/mle98/2deb6e0aa1da3aed70a73dad9c29e8f7

phase1() {
	# Update system

	pacman-key --init
	pacman-key --populate archlinux
	pacman -S --noconfirm archlinux-keyring
	pacman -Syu --noconfirm

	# Configure user

	echo "New username: "
	read -r NAME
	if ! id "$NAME" >/dev/null 2>&1; then
		useradd -m -G wheel -s /bin/bash "$NAME"
		passwd "$NAME"
	fi

	pacman -S --noconfirm --needed sudo

	sed -Ei '
		s/^# (%wheel ALL=\(ALL:ALL\) ALL)/\1/;
	' /etc/sudoers

	cat > /etc/wsl.conf << EOF
[boot]
systemd=true
[user]
default=${NAME}
EOF
}

phase2() {
	WINDOWS_USER="$1"
	[ -n "$WINDOWS_USER" ] || exit 1

	# AUR helper

	sudo pacman -S --noconfirm --needed git base base-devel

	if ! pacman -Qs trizen > /dev/null; then
		cd 
		rm -rf ./trizen
		git clone https://aur.archlinux.org/trizen.git
		cd ./trizen
		makepkg -si
		trizen -S trizen
		rm -rf ./trizen
		cd - > /dev/null
	fi

	# Compile custom WSLg
	# TODO

	# Install WSL config

	cat > "/mnt/c/Users/${WINDOWS_USER}/.wslconfig" << EOF
[wsl2]
guiApplications=true
systemDistro=C:\\\\Users\\\\${WINDOWS_USER}\\\\system.vhd
EOF

	# Install nix

	curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
	. /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh

	cat << EOF | sudo tee -a /etc/nix/nix.custom.conf > /dev/null
extra-experimental-features = pipe-operators
EOF

	# Pull dotfiles
	# TODO
	#
	# (edit)/etc/locale.gen
	# sudo locale-gen
	# echo LANG=en_US.UTF-8 to /etc/locale.conf
}

case "$1" in
    phase1)
        phase1
        ;;
    phase2)
        phase2 "$2" 
        ;;
    *)
        printf '%s\n' "Usage: $0 {phase1|phase2}"
        exit 1
        ;;
esac
