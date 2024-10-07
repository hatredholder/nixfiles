{ config, pkgs, ... }:

let
  wallpaperPath = "${config.home.homeDirectory}/pictures/wallpapers";
in
{
  home.file.wallpapers = {
    target = wallpaperPath;
    source = pkgs.nix-gitignore.gitignoreSourcePure
      ''
      README.md
      ''
     (pkgs.fetchFromGitHub {
      owner = "hatredholder";
      repo = "wallpapers";
      rev = "68a99257bff089d0ace4afd181e14e9e5b51604a";
      sha256 = "sha256-R8nUGOD4UYV4r4JXf9w2EwHmqL76iLjRS7CMW43aqho=";
    });
  };

  services.random-background = {
    enable = true;
    imageDirectory = wallpaperPath;
  };
}
