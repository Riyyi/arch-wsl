# Bootstrap Instructions for Host: arch-vm

Walkthrough for setting up an Arch Linux virtual machine and configuring dotfiles.

## VMware Virtual Machine Settings

Configure these settings before launching the VM for the first time.

1. **Settings → Display → 3D graphics**
   - Accelerate 3D graphics

2. **Settings → Options → Advanced**
   - Firmware type: **UEFI**

3. **Settings → Options → Shared Folders**
   - Always enabled
   - Add...
     - Host path: `C:\Share`
     - Name: `Share`
   - Enable this share

## Bootstrap Stage 0

Run these commands after booting into the VM for the first time.

```bash
pacman -Sy git
git clone https://github.com/Riyyi/arch-wsl
cd arch-wsl
./modules/hosts/arch-vm/bootstrap-stage0
```

The VM will reboot automatically.

## Bootstrap Stage 2

Run these commands after the VM reboots.

```bash
cd dotfiles
./modules/hosts/arch-vm/bootstrap-stage2
```
