{
  imports = [
    ./ssh.nix
  ]; 

  networking.networkmanager.enable = true;

  systemd.services.NetworkManager-wait-online.enable = false;
}
