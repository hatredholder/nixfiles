{
  imports =
    [ 
      ./hardware-configuration.nix
      ./disko.nix

      # base modules
      ../../system
      ../../system/network
      ../../system/programs/fonts.nix
      ../../system/services/ly.nix
      ../../system/services/pipewire.nix

      # system-specific modules
      ../../system/impermanence.nix
      ../../system/network/shadowsocks.nix
      ../../system/hardware/nvidia.nix
      ../../system/hardware/external-disk.nix
      ../../system/services/xserver/dwm.nix
    ];

  networking.hostName = "pc"; # Define your hostname.
}
