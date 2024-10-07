{ buildFirefoxXpiAddon, ... }: 

{
  # addons with custom settings
  surfingkeys-custom = buildFirefoxXpiAddon rec {
    pname = "surfingkeys-custom";
    version = "1.16";
    url = "https://github.com/32bitclone/${pname}/raw/main/${pname}-${version}.xpi";
    sha256 = "sha256-qXeSbhCQZOu9oPlfm/vBlnii5Knkfiig3e/Hh0gqwgc=";
    addonId = "surfingkeys-custom@triptogeneva";
    meta = {
      homepage = "https://github.com/32bitclone/surfingkeys-custom";
      description = "customized surfingkeys extension with a fix of the 'ctrl-h' & 'ctrl-6' shortcuts";
    };
  };
  tiled-tab-groups-custom = buildFirefoxXpiAddon rec {
    pname = "tiled-tab-groups-custom";
    version = "0.18.26";
    url = "https://github.com/32bitclone/${pname}/raw/main/${pname}-${version}.xpi";
    sha256 = "sha256-LKuyqM4EEzZDCmkidxSxAu08anBA6y1XX94NFBgJcqk=";
    addonId = "tiled-tab-groups-custom@triptogeneva";
    meta = {
      homepage = "https://github.com/32bitclone/tiled-tab-groups-custom";
      description = "customized tiled tab groups extension with a different default hotkey";
    };
  };
  privacy-redirect-custom = buildFirefoxXpiAddon rec {
    pname = "privacy-redirect-custom";
    version = "1.0.0";
    url = "https://github.com/32bitclone/${pname}/raw/main/${pname}-${version}.xpi";
    sha256 = "sha256-J1PKltbJVtsSsr7d75mAN9DE6ALCVR9qkKjfIgncZdw=";
    addonId = "privacy-redirect-custom@triptogeneva";
    meta = {
      homepage = "https://github.com/32bitclone/privacy-redirect-custom";
      description = "customized privacyredirect extension with redirects to personalized sites";
    };
  };
  # addons not available in nix user repository
  ctrl-number-tabs = buildFirefoxXpiAddon rec {
    pname = "ctrl_number_to_switch_tabs";
    version = "1.0.2";
    url = "https://addons.mozilla.org/firefox/downloads/file/4192880/${pname}-${version}.xpi";
    sha256 = "sha256-d30B3e2vAnQ29GUYFM/pRlhVLuMRvux0V1NjNAFVCmg";
    addonId = "{84601290-bec9-494a-b11c-1baa897a9683}";
    meta = {
      homepage = "https://github.com/AbigailBuccaneer/firefox-ctrlnumber";
      description = "ctrl + number to switch between open tabs";
    };
  };
  font-fingerprint-defender = buildFirefoxXpiAddon rec {
    pname = "font-fingerprint-defender";
    version = "0.1.4";
    url = "https://addons.mozilla.org/firefox/downloads/file/4028360/${pname}-${version}.xpi";
    sha256 = "sha256-hF4tHp/eZ9Iab0wrDti9gegYKYg6ypn5VpkZq8BumzQ=";
    addonId = "{96ef5869-e3ba-4d21-b86e-21b163096400}";
    meta = {
      homepage = "https://mybrowseraddon.com/font-defender.html";
      description = "defends against font fingerprinting by reporting a fake value";
    };
  };
  chameleon = buildFirefoxXpiAddon rec {
    pname = "chameleon_ext";
    version = "0.22.65.1";
    url = "https://addons.mozilla.org/firefox/downloads/file/4349329/${pname}-${version}.xpi";
    sha256 = "sha256-UPv7ZCla0eIqZEnggGilBKQIMvmX9uD+Y2BG0NIDISk=";
    addonId = "{3579f63b-d8ee-424f-bbb6-6d0ce3285e6a}";
    meta = {
      homepage = "https://github.com/sereneblue/chameleon";
      description = "spoof your browser profile";
    };
  };
}
