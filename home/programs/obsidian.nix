{ config, pkgs, ... }: 

{
  home.packages = [pkgs.obsidian];

  home.persistence."/persist/home/${config.home.username}" = {
    allowOther = true;
    directories = [
      ".config/obsidian"
    ];
  };
}
