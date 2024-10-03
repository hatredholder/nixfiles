{
  disko.devices = {
    disk.main = {
      device = "/dev/disk/by-id/ata-CT480BX500SSD1_2106E4F3806D";
      type = "disk";
      content = {
        type = "gpt";
        partitions = {
          # boot partition
          boot = {
            size = "1M";
            type = "EF02"; # for grub MBR
          };
          esp = {
            size = "1G";
            type = "EF00";
            content = {
              type = "filesystem";
              format = "vfat";
              mountpoint = "/boot";
            };
          };
          # root partition
          root = {
            size = "100%";
            content = {
              type = "btrfs";
              extraArgs = [ "-f" ];
              subvolumes = {
                "/root" = {
                  mountpoint = "/";
                  mountOptions = [ "subvol=root" "compress=zstd" "noatime" ];
                };
                "/nix" = {
                  mountpoint = "/nix";
                  mountOptions = [ "subvol=nix" "compress=zstd" "noatime" ];
                };
                "/persist" = {
                  mountpoint = "/persist";
                  mountOptions = [ "subvol=persist" "compress=zstd" "noatime" ];
                };
                "/swap" = {
                  mountpoint = "/swap";
                  swap.swapfile.size = "8G";
                };
              };
            };
          };
        };
      };
    };
  };
}
