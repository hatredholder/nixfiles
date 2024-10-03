{ config, ... }:

{
  programs.zoxide.enable = true;

  home.persistence."/persist/home/${config.home.username}" = {
    allowOther = true;
    directories = [
      ".local/share/zoxide"
    ];
  };
}
