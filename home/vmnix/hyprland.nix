{ config, pkgs, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    package = null;
    portalPackage = null;

    systemd.enable = true;

    settings = {
      "$mod" = "SUPER";

      input = {
        kb_layout = "de";
        kb_variant = "nodeadkeys";
      };

      monitor = [
        "Virtual-1, 1920x1080x60, 0x0, 1"
      ];

      bind = [
        "$mod, T, exec, kitty"
      ]
      ++ (
        builtins.concatLists (builtins.genList (i:
          let ws = i + 1;
          in [
            "$mod, code:1${toString i}, workspace, ${toString ws}"
            "$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
          ]
        )
        9)
      );
    };
  };
}