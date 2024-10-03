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
      rev = "44f30c56294fbcc0478b3a32ec5857b6a0870fdc";
      sha256 = "sha256-ddCuLdYJv/wMX+2RpVmNQhV/koTzRaNwuLWu7q+8kIc=";
    });
  };

  services.random-background = {
    enable = true;
    imageDirectory = wallpaperPath;
  };
}
