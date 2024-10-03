{ pkgs, ... }: 

{

  imports = [
    ./eza.nix
    ./git.nix
    ./tmux.nix
    ./xdg.nix
    ./zoxide.nix
  ];

  home.packages = with pkgs; [
    # crypto
    monero

    # archives
    zip 
    unzip

    # utils
    gnumake # control the generation of non-source files
    file # show the type of files
    ripgrep # better "grep"
    htop # better "top"
    tree # directory structure tree
    cryptsetup # LUKS for dm-crypt
  ];
}
