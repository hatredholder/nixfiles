{ pkgs, ... }:

let
  eza-emoji = pkgs.eza.overrideAttrs (oldAttrs: rec {
    pname = "eza";
    version = "0.19.2";
    src = pkgs.fetchFromGitHub {
      owner = "hatredholder";
      repo = "eza-emoji";
      rev = "dfad3e257aade0197f2eb94effe418d5928ed4ec";
      sha256 = "sha256-F00RljX/Cdjn35yC5tU4fL3C9RuepJYqxJLbDD9Jv84=";
    };
    # https://discourse.nixos.org/t/overriding-version-cant-find-new-cargohash/31502/6
    cargoDeps = oldAttrs.cargoDeps.overrideAttrs (_: {
      name = "${pname}-vendor.tar.gz";
      inherit src;
      outputHash = "sha256-jq9GzgdPPT57MxlNpGG79JkS2WOODN6CUTOSvmpisRo=";
    });
  });
in
{
  programs.eza = {
    enable = true;
    package = eza-emoji;
  };
}
