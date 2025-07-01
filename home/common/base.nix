{ config, pkgs, ... }:

{
  home.username = "cozygalvinism";
  home.homeDirectory = "/home/cozygalvinism";
  home.stateVersion = "25.05";

  home.packages = with pkgs; [
    fish
  ];

  programs.bash = {
    initExtra = ''
      if [[ $(${pkgs.procps}/bin/ps --no-header --pid=$PPID --format=comm) != "fish" && -z ''${BASH_EXECUTION_STRING} ]]
      then
        shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=""
        exec ${pkgs.fish}/bin/fish $LOGIN_OPTION
      fi
    '';
  };

  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
  };
  programs.fish = {
    plugins = [
      { name = "plugin-git"; src = pkgs.fishPlugins.plugin-git.src; }
      { name = "fzf-fish"; src = pkgs.fishPlugins.fzf-fish.src; }
    ];
  };
}