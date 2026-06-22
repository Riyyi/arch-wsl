{
  flake.homeModules.vmware =
    { lib, pkgs, ... }:
    {

      preferences.dnfPackages = [
        "gtkmm3.0"
        "mesa-dri-drivers"
        "mesa-vulkan-drivers"
        "open-vm-tools"
        "open-vm-tools-desktop"
        "vulkan-loader"
      ];

      preferences.pacmanPackages = [
        "gtkmm3"
        "mesa"
        "open-vm-tools"
        "vulkan-icd-loader"
      ];

      home.activation.vmware =
        let
          service = "vmhgfs-fuse-mount-share.service";
        in
        lib.hm.dag.entryAfter [ "pacmanPackages" "dnfPackages" ] ''
          if test -x /bin/vmtoolsd > /dev/null 2>&1; then
              /bin/sudo mkdir -p /mnt/share

              /bin/sudo systemctl enable --now vmtoolsd.service
              /bin/sudo systemctl enable --now vmware-vmblock-fuse.service

              UNIT_SRC="${pkgs.writeText "${service}" ''
                [Unit]
                Description=Mount /Share
                After=network.target

                [Service]
                Type=oneshot
                ExecStart=/bin/vmhgfs-fuse .host:/Share /mnt/share -o allow_other
                RemainAfterExit=yes

                [Install]
                WantedBy=multi-user.target
              ''}"

              /bin/sudo cp "$UNIT_SRC" /etc/systemd/system/${service}
              /bin/sudo systemctl daemon-reload
              /bin/sudo systemctl enable --now ${service}
          else
              _iError "Package not installed, skipping 'open-vm-tools'"
          fi
        '';

    };
}
