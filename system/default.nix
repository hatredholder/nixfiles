{ pkgs, ... }:

{
  # dont change this
  system.stateVersion = "24.05";

  # enable grub as bootloader
  boot.loader.grub.enable = true;

  # set timezone to moscow
  time.timeZone = "Europe/Moscow";

  # configure locale settings
  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "en_US.UTF-8";
      LC_IDENTIFICATOIN = "en_US.UTF-8";
      LC_MEASUREMENT = "en_US.UTF-8";
      LC_MONETARY = "en_US.UTF-8";
      LC_NAME = "en_US.UTF-8";
      LC_NUMERIC = "en_US.UTF-8";
      LC_PAPER = "en_US.UTF-8";
      LC_TELEPHONE = "en_US.UTF-8";
      LC_TIME = "en_US.UTF-8";
    };
  };

  # essential tools
  environment.systemPackages = with pkgs; [
    git
    vim
    curl
    wget
  ];

  # user configuration
  users.users.hatredholder = {
    isNormalUser = true;
    initialPassword = "1";
    extraGroups = ["networkmanager" "wheel" "docker"];
    shell = pkgs.zsh;
  }; 
  programs.zsh.enable = true;

  # don't ask wheel group for password
  security.sudo.wheelNeedsPassword = false;

  # nix configuration
  nix.settings = {
    auto-optimise-store = true;
    experimental-features = [ "nix-command" "flakes" ]; 
  };
  nixpkgs.config.allowUnfree = true;
}
