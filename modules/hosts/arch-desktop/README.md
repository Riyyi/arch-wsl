# Bootstrap Instructions for Host: arch-desktop

Walkthrough for setting up an Arch Linux destkop and configuring dotfiles.

## Bootstrap Stage 0

Run these commands after booting into the VM for the first time.

```bash
pacman -Sy git
git clone https://github.com/Riyyi/arch-wsl
cd arch-wsl
./modules/hosts/arch-desktop/bootstrap-stage0
```

The machine will reboot automatically.

## Bootstrap Stage 2

Run these commands from TTY2 after the machine reboots.

```bash
cd dotfiles
./modules/hosts/arch-desktop/bootstrap-stage2
```
