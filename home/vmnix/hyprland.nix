{ config, pkgs, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    package = pkgs.hyprland;

    systemd.enable = true;

    settings = {
      "$mod" = "SUPER";
    };
  };
}