{ config, inputs, ... }:

{
  imports = [
    inputs.impermanence.nixosModules.home-manager.impermanence
  ];

  # home directories to keep
  home.persistence."/persist/home/${config.home.username}/" = {
    directories = [
      ".config/nixos"
      ".ssh"
      "desktop"
      "documents"
      "downloads"
      "pictures"
    ];
    allowOther = true;
  };

  systemd.user.tmpfiles.rules = [
    "d /persist/home/${config.home.username}/ 0700 ${config.home.username} users -" # create /persist/home/user/ owned by user
  ];
}
