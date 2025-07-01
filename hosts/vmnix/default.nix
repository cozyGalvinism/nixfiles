{ config, pkgs, ... }:

{
  imports = [ ./hardware.nix ];

  networking.hostName = "vmnix";
  environment.systemPackages = with pkgs; [
    kitty
  ];

  services.xserver = {
    videoDrivers = ["nvidia"];
  };

  hardware.nvidia = {
    modesetting.enable = true;

    nvidiaSettings = true;
  };

  programs.hyprland = {
    enable = true;
  };

  system.stateVersion = "25.05";
}