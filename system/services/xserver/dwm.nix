{ pkgs, ... }:

let
  slstatus-custom = pkgs.slstatus.override ({
    conf = ''
      /* interval between updates (in ms) */
      const unsigned int interval = 1000;

      /* text to show if no value can be retrieved */
      static const char unknown_str[] = "n/a";

      /* maximum output string length */
      #define MAXLEN 2048

      static const struct arg args[] = {
        /* function format          argument */
        { keymap,      "🌍 %s ",        NULL     },
        { uptime,      "⬆️ %s ",         NULL     },
        { netspeed_rx, "🛜 %sB/s ",     "enp3s0" },
        { cpu_perc,    "📀 CPU: %s%% ", NULL     },
        { ram_perc,    "💿 RAM: %s%% ", NULL     },
        { run_command, "🔊 %s ",        "${pkgs.wireplumber}/bin/wpctl get-volume @DEFAULT_AUDIO_SINK@ | sed 's/Volume: //'"},
        { datetime,    "🗓️ %s ",         "%F"  },
        { datetime,    "🕓 %s",         "%T"  },
      };
    '';
  });
in 
{
  imports = [
    ./default.nix
  ];

  environment.systemPackages = with pkgs; [
    dmenu # application launcher
  ];

  services.xserver.windowManager.dwm = {
    enable = true;
    package = pkgs.dwm.overrideAttrs {
      src = pkgs.fetchFromGitHub {
        owner = "hatredholder";
        repo = "dwm";
        rev = "56f9792feab69da8b4ed0e7af74bb7bb6f5d7ade";
        sha256 = "sha256-rA/d+dKabDYadiNJE9Xi8hQNtk9VjV/9PjdR7G4S0VM=";
      };
    };
  };

  systemd.user.services.slstatus = {
    wantedBy = [ "graphical-session.target" ];
    serviceConfig = {
      ExecStart = "${slstatus-custom}/bin/slstatus";
      RestartSec = 3;
      Restart = "always";
    };
  };
}
