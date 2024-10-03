{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    scrot # screenshot software
    xclip # clipboard cli
  ];

  services.xserver = {
    enable = true;
    xkb = {
      layout = "us,ru";
      variant = "";
      options = "caps:swapescape, grp:rshift_toggle";
    };
  };

  # window compositor
  systemd.user.services.compositor = {
    wantedBy = [ "graphical-session.target" ];
    partOf = [ "graphical-session.target" ];
    serviceConfig = {
      ExecStart = "${pkgs.fastcompmgr}/bin/fastcompmgr";
    };
  };
}
