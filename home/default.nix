{ inputs, ... }:

{
  # import home-manager modules
  imports = [
    ./impermanence.nix

    ./programs/firefox
    ./programs/lf
    ./programs/obsidian.nix
    ./programs/neovim.nix

    ./terminal/tools
    ./terminal/st.nix
    ./terminal/zsh.nix

    ./services/syncthing.nix
    ./services/wallpaper.nix
  ];

  # configure home
  home = rec {
    username = "hatredholder";
    homeDirectory = "/home/${username}";
    stateVersion = "24.05";
  };
}
