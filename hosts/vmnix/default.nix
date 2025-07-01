{ config, pkgs, ... }:

{
  imports = [ ./hardware.nix ];

  boot.loader.grub.enable = true;
  boot.loader.grub.devices = [ "/dev/vda" ];
  boot.loader.grub.useOSProber = true;

  networking.hostName = "vmnix";
  environment.systemPackages = with pkgs; [
    kitty
  ];
  networking.firewall.enable = false;

  services.xserver = {
    enable = true;
    videoDrivers = [ "qxl" ];
    xkb = {
      layout = "de";
      variant = "nodeadkeys";
    };
  };

  services.displayManager.sddm = {
    enable = true;
    wayland = {
      enable = true;
    };
  };

  services.qemuGuest.enable = true;
  services.spice-vdagentd.enable = true;

  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
    };
  };

  hardware.nvidia = {
    modesetting.enable = true;
    open = true;
    nvidiaSettings = true;
  };

  programs.hyprland = {
    enable = true;
  };

  system.stateVersion = "25.05";
}