{ config, pkgs, ...  }: 

{
  xdg = {
    userDirs = {
      enable = true;
      createDirectories = true;

      documents = "${config.home.homeDirectory}/documents";
      download = "${config.home.homeDirectory}/downloads";
      pictures = "${config.home.homeDirectory}/pictures";
      desktop = "${config.home.homeDirectory}/desktop";
      templates = null;
      music = null;
      videos = null;
      publicShare = null;
    };
  };

  home.packages = with pkgs; [
    xdg-utils # tools that assist with desktop integration tasks
  ];
}
