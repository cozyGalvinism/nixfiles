{ config, pkgs, ... }:

{
  imports = [ ./hardware.nix ];

  networking.hostName = "skaianet";
  environment.systemPackages = with pkgs; [
    kitty
  ];

  # enable 32-bit support for wine and proton
  hardware.graphics.enable32Bit = true;

  

  system.stateVersion = "25.05";
}