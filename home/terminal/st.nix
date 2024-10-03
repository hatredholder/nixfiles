{ pkgs, ... }:

let
  st-custom = pkgs.st.overrideAttrs ({
    src = pkgs.fetchFromGitHub {
      owner = "hatredholder";
      repo = "st";
      rev = "1647da71dc703f7f9d51c4bdf3eb8fb11b5acb2e";
      sha256 = "sha256-hDlDRg4FWFAdLRfiGVrJ+zje2k85PWjSHtU4jbMmZn8=";
    };
  });
in
{
  home.packages = with pkgs; [
    st-custom
  ];

  home.sessionVariables = {
    TERMINAL = "st";
  };
}
