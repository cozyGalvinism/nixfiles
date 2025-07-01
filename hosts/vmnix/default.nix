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
    videoDrivers = ["nvidia"];
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