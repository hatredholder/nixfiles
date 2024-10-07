{ config, pkgs, ...  }: 

let
  customAddons = pkgs.callPackage ./addons.nix {
    inherit (pkgs.nur.repos.rycee.firefox-addons) buildFirefoxXpiAddon;
  };
in 
{
  programs.firefox = {
    enable = true;
    policies.DefaultDownloadDirectory = "${config.xdg.userDirs.download}";
    languagePacks = [ "fr" "en-US" ];
    profiles.${config.home.username} = {
      extensions = with pkgs.nur.repos.rycee.firefox-addons; [
        ublock-origin # https://addons.mozilla.org/firefox/addon/ublock-origin/
        istilldontcareaboutcookies # https://addons.mozilla.org/firefox/addon/istilldontcareaboutcookies/
      ]
      ++ (with customAddons; [
        # addons with custom settings
        surfingkeys-custom # https://github.com/32bitclone/surfingkeys-custom
        tiled-tab-groups-custom # https://github.com/32bitclone/tiled-tab-groups-custom
        privacy-redirect-custom # https://github.com/32bitclone/privacy-redirect-custom
        # addons not available in nix user repository
        ctrl-number-tabs # https://addons.mozilla.org/firefox/addon/ctrl-number-to-switch-tabs
      ]);
      bookmarks = {};
      containersForce = true;
      containers = {
        earth = {
          name = "Earth Container";
          color = "green";
          icon = "fingerprint";
          id = 1;
        };
        ember = {
          name = "Ember Container";
          color = "red";
          icon = "fingerprint";
          id = 2;
        };
        storm = {
          name = "Storm Container";
          color = "blue";
          icon = "fingerprint";
          id = 3;
        };
        void = {
          name = "Void Container";
          color = "purple";
          icon = "fingerprint";
          id = 4;
        };
      };
      settings = {
        ## theming
        # dark theme 
        "extensions.activeThemeID" = "firefox-compact-dark@mozilla.org";

        # titlebar tabs
        "browser.tabs.inTitlebar" = 0;

        # clear toolbar
        "browser.uiCustomization.state" = "{\"placements\":{\"widget-overflow-fixed-list\":[],\"unified-extensions-area\":[],\"nav-bar\":[\"back-button\",\"forward-button\",\"stop-reload-button\",\"customizableui-special-spring1\",\"urlbar-container\",\"customizableui-special-spring2\",\"downloads-button\",\"unified-extensions-button\"],\"toolbar-menubar\":[\"menubar-items\"],\"TabsToolbar\":[\"tabbrowser-tabs\",\"new-tab-button\",\"alltabs-button\"],\"PersonalToolbar\":[\"personal-bookmarks\"]},\"seen\":[\"save-to-pocket-button\",\"developer-button\"],\"dirtyAreaCache\":[\"nav-bar\",\"TabsToolbar\",\"toolbar-menubar\",\"PersonalToolbar\"],\"currentVersion\":20,\"newElementCount\":3}";

        ## features
        # resume previous session
        "browser.startup.page" = 3;

        # resist fingerprinting
        "privacy.resistFingerprinting" = true;

        # clear cookies on shutdown
        "privacy.sanitize.sanitizeOnShutdown" = true;
        "privacy.history.custom" = true;
        "privacy.clearOnShutdown.cookies" = true;
        "privacy.clearOnShutdown.downloads" = false;
        "privacy.clearOnShutdown.history" = false;

        # configure proxy
        "network.proxy.socks" = "127.0.0.1";
        "network.proxy.socks_port" = 1080;
        "network.proxy.type" = 1;
        "network.proxy.no_proxies_on" = "*.ru, *vk.com, *habr.com";

        # disable geolocation
        "geo.enabled" = false;
        "geo.provider.use_geoclue" = false;

        # disable extension recommendations
        "extensions.getAddons.showPane" = false;
        "extensions.htmlaboutaddons.recommendations.enabled" = false;
        "browser.discovery.enabled" = false;

        # disable telemetry
        "toolkit.telemetry.enabled" = false;
        "toolkit.telemetry.coverage.opt-out" = true;
        "toolkit.coverage.opt-out" = true;
        "datareporting.policy.dataSubmissionEnabled" = false;
        "datareporting.healthreport.uploadEnabled" = false;

        # disable studies
        "app.shield.optoutstudies.enabled" =  false;
        "app.normandy.enabled" = false;

        # disable passwords
        "signon.autofillForms" = false;
        "signon.rememberSignons" = false;

        # disable translations
        "browser.translations.enable" = false;

        # disable bookmarks bar
        "browser.toolbars.bookmarks.visibility" = "never";

        # disable picture-in-picture
        "media.videocontrols.picture-in-picture.video-toggle.enabled" = false;

        # disable new tab sites
        "browser.newtabpage.activity-stream.feeds.topsites" = false;

        # disable first-run welcome
        "browser.aboutwelcome.enabled" = false;
      };
    };
  };

  home.persistence."/persist/home/${config.home.username}" = {
    allowOther = true;
    directories = [
      ".mozilla"
    ];
  };
}
