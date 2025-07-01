{ config, pkgs, ... }:

{
  home.username = "cozygalvinism";
  home.homeDirectory = "/home/cozygalvinism";
  home.stateVersion = "25.05";

  home.packages = with pkgs; [
    fish
  ];

  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
  };
  programs.fish = {
    enable = true;
    plugins = [
      { name = "plugin-git"; src = pkgs.fishPlugins.plugin-git.src; }
      { name = "fzf-fish"; src = pkgs.fishPlugins.fzf-fish.src; }
    ];
  };
}