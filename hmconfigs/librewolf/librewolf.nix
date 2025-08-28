{ config, pkgs, ...}:

{
  programs.librewolf = {
    settings = {
      "webgl.disabled" = true;
      "privacy.resistFingerprinting" = true;
      "privacy.resistFingerprinting.letterboxing" = true;
      "privacy.clearOnShutdown.history" = false;
      "privacy.clearOnShutdown.cookies" = false;
      "identity.fxaccounts.enabled" = true;
      "middlemouse.paste" = false;
      "general.autoScroll" = true;
      "cookiebanners.service.mode.privateBrowsing" = 2;
      "cookiebanners.service.mode" = 2;
      "privacy.donottrackheader.enabled" = true;
    };
    policies = {
      DisableTelemetry = true;
      DisableFirefoxStudies = true;
      ExtensionSettings = {
        "446900e4-71c2-419f-a6a7-df9c091e268b" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/file/4541517/bitwarden_password_manager-2025.7.0.xpi";
          installation_mode = "force_installed";
        };
        "addon@darkreader.org" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/file/4535824/darkreader-4.9.110.xpi";
          installation_mode = "force_installed";
        };
        "762f9885-5a13-4abd-9c77-433dcd38b8fd" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/file/4371820/return_youtube_dislikes-3.0.0.18.xpi";
          installation_mode = "force_installed";
        };
        "sponsorBlocker@ajay.app" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/file/4541835/sponsorblock-5.14.xpi";
          installation_mode = "force_installed";
        };
        "uBlock0@raymondhill.net" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/file/4531307/ublock_origin-1.65.0.xpi";
          installation_mode = "force_installed";
        };
        "myallychou@gmail.com" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/file/4263531/youtube_recommended_videos-1.6.7.xpi";  
          installation_mode = "force_installed";
        };
        "d7742d87-e61d-4b78-b8a1-b469842139fa" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/file/4524018/vimium_ff-2.3.xpi";
          installation_mode = "force_installed";
        };
        "https://addons.mozilla.org/firefox/downloads/file/4226329/nicothin_space-1.1.2.xpi" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/file/4226329/nicothin_space-1.1.2.xpi";
          installation_mode = "force_installed";
        };
      };  
    };
  };

  # xdg.mimeApps = {
  #   enable = true;
  #   defaultApplications = {
  #     "text/html" = "librewolf.desktop";
  #     "x-scheme-handler/http" = "librewolf.desktop";
  #     "x-scheme-handler/https" = "librewolf.desktop";
  #     "x-scheme-handler/about" = "librewolf.desktop";
  #     "x-scheme-handler/unknown" = "librewolf.desktop";
  #   };
  # };
}
