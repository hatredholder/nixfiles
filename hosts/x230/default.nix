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
      ../../system/hardware/bluetooth.nix
      ../../system/services/xserver/dwm.nix
    ];

  networking.hostName = "x230"; # Define your hostname.
}
