{ config, ... }:

{
  services.syncthing = {
    enable = true;
    extraOptions = [ 
      "--data=${config.home.homeDirectory}/.config/syncthing" 
      "--config=${config.home.homeDirectory}/.config/syncthing" 
      "--no-default-folder"
    ];
  };

  home.persistence."/persist/home/${config.home.username}" = {
    allowOther = true;
    directories = [
      ".config/syncthing"
    ];
  };
}
