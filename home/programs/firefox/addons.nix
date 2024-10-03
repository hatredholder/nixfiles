{ buildFirefoxXpiAddon, lib, ... }: 

{
  surfingkeys-custom = buildFirefoxXpiAddon rec {
    pname = "surfingkeys-custom";
    version = "1.16";
    url = "https://github.com/32bitclone/${pname}/raw/main/${pname}-${version}.xpi";
    sha256 = "sha256-qXeSbhCQZOu9oPlfm/vBlnii5Knkfiig3e/Hh0gqwgc=";
    addonId = "surfingkeys-custom@triptogeneva";
    meta = with lib; {
      homepage = "https://github.com/32bitclone/surfingkeys-custom";
      description = "customized surfingkeys extension with a fix of the 'ctrl-h' & 'ctrl-6' shortcuts";
      platforms = platforms.all;
    };
  };
  tiled-tab-groups-custom = buildFirefoxXpiAddon rec {
    pname = "tiled-tab-groups-custom";
    version = "0.18.26";
    url = "https://github.com/32bitclone/tiled-tab-groups-custom/raw/main/${pname}-${version}.xpi";
    sha256 = "sha256-LKuyqM4EEzZDCmkidxSxAu08anBA6y1XX94NFBgJcqk=";
    addonId = "tiled-tab-groups-custom@triptogeneva";
    meta = with lib; {
      homepage = "https://github.com/32bitclone/tiled-tab-groups-custom";
      description = "customized tiled tab groups extension with a different default hotkey";
      platforms = platforms.all;
    };
  };
  soundfixer = buildFirefoxXpiAddon rec {
    pname = "soundfixer";
    version = "1.4.1";
    url = "https://addons.mozilla.org/firefox/downloads/file/4205769/${pname}-${version}.xpi";
    sha256 = "sha256-sinHdjXk6Jq1hhRK6i/Ml3osXlFQmoSsiE+lninud5I=";
    addonId = "soundfixer@unrelenting.technology";
    meta = with lib; {
      homepage = "https://github.com/valpackett/soundfixer";
      description = "fix sound problems in YouTube videos";
      platforms = platforms.all;
    };
  };
  ctrl-number-tabs = buildFirefoxXpiAddon rec {
    pname = "ctrl_number_to_switch_tabs";
    version = "1.0.2";
    url = "https://addons.mozilla.org/firefox/downloads/file/4192880/ctrl_number_to_switch_tabs-1.0.2.xpi";
    sha256 = "sha256-d30B3e2vAnQ29GUYFM/pRlhVLuMRvux0V1NjNAFVCmg";
    addonId = "{84601290-bec9-494a-b11c-1baa897a9683}";
    meta = with lib; {
      homepage = "https://github.com/AbigailBuccaneer/firefox-ctrlnumber";
      description = "ctrl + number to switch between open tabs";
      platforms = platforms.all;
    };
  };
}
