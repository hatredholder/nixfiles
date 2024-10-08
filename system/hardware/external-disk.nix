{ pkgs, secrets, ... }:

let
  lukspassfile = pkgs.writeText "cryptpass" "${secrets.externalDrive.luks.password}";
in
{
  # create a decryption service
  environment.etc.crypttab.text = ''
    external UUID=${secrets.externalDrive.luks.partitionUUID} ${lukspassfile} noauto
  '';

  # call decrypt service when device is connected
  services.udev.extraRules = ''
    SUBSYSTEM=="block" ENV{ID_WWN}=="${secrets.externalDrive.WWN}",\
    ENV{SYSTEMD_WANTS}="systemd-cryptsetup@external.service"
  '';

  # mount the uncrypted device
  fileSystems."/mnt/external" = {
    device = "/dev/mapper/external";
    options = [
      "noauto"
      "nofail"
      "noatime"
      "x-systemd.automount"
      "x-systemd.idle-timeout=10"
      "x-systemd.device-timeout=5" 
    ];
  };
}
