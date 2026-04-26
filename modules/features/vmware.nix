{
  flake.homeModules.vmware = {

    preferences.pacmanPackages = [
      "gtkmm3"
      "mesa"
      "open-vm-tools"
      "vulkan-icd-loader"
    ];

    # TODO:
    # systemd unit to mount share, system-manager (?)
    # sudo vmhgfs-fuse .host:/Share /mnt/share -o allow_other

    # systemctl enable vmtoolsd.service
    # systemctl enable vmware-vmblock-fuse.service

  };
}
