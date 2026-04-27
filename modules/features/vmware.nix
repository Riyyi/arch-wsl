{
  flake.homeModules.vmware =
    { lib, pkgs, ... }:
    {

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
        lib.hm.dag.entryAfter [ "writeBoundary" ] ''
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
        '';

    };
}
