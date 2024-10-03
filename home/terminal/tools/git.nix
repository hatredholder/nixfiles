{ config, ...  }: 

{
  programs.git = {
    enable = true;

    userName = "${config.home.username}";
    userEmail = "surrogatesoul@proton.me";

    ignores = ["*~" "*.swp" "*result*" ".direnv" "node_modules"];
  };
}
