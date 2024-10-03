{ config, pkgs, ...  }: 

{
  home.packages = with pkgs; [
    git-crypt # transparent file encryption in git
  ];

  programs.git = {
    enable = true;

    userName = "${config.home.username}";
    userEmail = "surrogatesoul@proton.me";

    ignores = ["*~" "*.swp" "*result*" ".direnv" "node_modules"];
  };
}
