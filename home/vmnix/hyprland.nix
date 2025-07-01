{ config, pkgs, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    package = null;
    portalPackage = null;
    
    systemd.enable = true;

    settings = {
      "$mod" = "SUPER";
    };
  };
}