ratemirrors() {
	rate-mirrors arch | sudo tee /etc/pacman.d/mirrorlist
	rate-mirrors endeavouros | sudo tee /etc/pacman.d/endeavouros-mirrorlist
}

updatesoftware() {
	if [ -f "/etc/arch-release" ]; then
		sudo pacman -Syu
		yay -Syu
	fi

	if [ -f "/usr/bin/flatpak" ]; then
		flatpak update -y
		flatpak remove --unused
	fi
}

updatefirmware() {
	fwupdmgr refresh --force
	fwupdmgr update
}

updateall() {
	updatesoftware
	updatefirmware
}

# pacman browse remote packages
pkgsremote() {
	pacman -Slq | fzf --preview 'pacman -Si {}' --layout=reverse
}

# pacman browse installed packages
pkgsinstalled() {
	pacman -Qq | fzf --preview 'pacman -Qil {}' --layout=reverse --bind 'enter:execute(pacman -Qil {} | less)'
}
