{ config, lib, pkgs, ... }:

let
  ctpv-custom = pkgs.ctpv.overrideAttrs ({
    preFixup = ''
      wrapProgram $out/bin/ctpv \
        --prefix PATH ":" "${lib.makeBinPath [
          pkgs.atool # for archives
          pkgs.bat # for general files
          pkgs.ffmpegthumbnailer # for audio/video
          pkgs.poppler_utils # for pdf
          pkgs.ueberzugpp # for images
        ]}";
    '';
  });
  ctpv-cleaner = pkgs.writeScriptBin "ctpv-cleaner" '' 
    #!/usr/bin/env bash
    [ -z "$id" ] && id="$1"

    exec ${ctpv-custom}/bin/ctpv -c "$id"
  '';
in
{
  programs.lf = {
    enable = true;
    settings = {
      icons = true;
      hidden = true;
      cursorpreviewfmt = "\\033[7m"; # old preview column
    };
    keybindings = {
      v = ''$nvim "$f"'';
      sv = ''$sudoedit "$f"'';

      "." = "set hidden!";
      "<enter>" = "open";
      "<esc>" = "unselect";
      d = "delete";
      x = "cut";
      p = "paste";
      a = "mkfile";
      md = "mkdir";
      R = "reload";
 
      u = "";
    };
    previewer = {
      keybinding = "i";
      source = "${ctpv-custom}/bin/ctpv";
    };
    extraConfig = ''
      &${ctpv-custom}/bin/ctpv -s $id
      cmd on-quit %${ctpv-custom}/bin/ctpv -e $id
      set cleaner ${ctpv-cleaner}/bin/ctpv-cleaner
    '';
  };

  xdg.configFile = {
    "${config.home.homeDirectory}/.config/lf/icons".source = ./icons;
  };
}
