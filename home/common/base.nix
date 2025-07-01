{ config, pkgs, ... }:

{
  home.username = "cozygalvinism";
  home.homeDirectory = "/home/cozygalvinism";
  home.stateVersion = "25.05";

  home.packages = with pkgs; [];
}