{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    git
    wget
    curl
  ];
  
  nix.settings = {
    experimental-features = ["nix-command" " flakes"];
  };
  nixpkgs.config.allowUnfree = true;

  console.keyMap = mkDefault "de-latin1-nodeadkeys";

  users.users = {
    cozygalvinism = {
      isNormalUser = true;
      home = "/home/cozygalvinism";
      description = "cozyGalvinism";
      extraGroups = [ "wheel" "networkmanager" ];
      openssh.authorizedKeys = [];
    };
  };

  boot.loader.grub.enable = true;

  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Berlin";
  i18n.defaultLocale = "en_GB.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "de_DE.UTF-8";
    LC_IDENTIFICATION = "de_DE.UTF-8";
    LC_MEASUREMENT = "de_DE.UTF-8";
    LC_MONETARY = "de_DE.UTF-8";
    LC_NAME = "de_DE.UTF-8";
    LC_NUMERIC = "de_DE.UTF-8";
    LC_PAPER = "de_DE.UTF-8";
    LC_TELEPHONE = "de_DE.UTF-8";
    LC_TIME = "de_DE.UTF-8";
  };

  programs.nix-ld.enable = true;
}