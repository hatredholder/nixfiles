{
  services.pipewire = {
    enable = true;
    pulse.enable = true;

    wireplumber.extraConfig = {
      # set default volume to 100%
      "60-defaults"."wireplumber.settings"."device.routes.default-sink-volume" = 1;
    };
  };

  hardware.pulseaudio.enable = false;
}
