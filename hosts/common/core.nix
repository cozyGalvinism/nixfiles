{ config, pkgs, lib, ... }:

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

  console.keyMap = lib.mkDefault "de-latin1-nodeadkeys";

  users.users = {
    cozygalvinism = {
      isNormalUser = true;
      home = "/home/cozygalvinism";
      description = "cozyGalvinism";
      extraGroups = [ "wheel" "networkmanager" ];
      openssh.authorizedKeys = {
        keys = [
          "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQChmzcc48EEh/G8zRUMi+LvwiFqi4FMJhv+VJ+M2Y3uGWt/KTB8pSCt40WVkTmsFWs6GmwihzhW0Q/b08osXVv/EgcjX6NPUhiWTdAEb0tftfSLwmkPdfJOwt28K6aBGqOhxya9Gp05ezb6sDDFdpqoiTQvujC0aCx4HAU2ntHWWi3YRer0vR95jiIBGAPI9H4EGCAhEeOuS2m6U79r0g+x9+e1xSjvtQz4BLslygitqrn3G2OUWZLDcmuC4U84+nf/c+bFScMwCk91BM0ldEskAOZxg3X7CgcAE3dBFIra4if8ktYZ/GcQQOqij6jAJb67ElrC/GfUJsa+asp09fGRw11Wx7DWXGb4bJ0vmBZ28KKIE2fKqp2KNIQVLTmItG4kKw2FXgVA/Iq4m6yAjBqjmZkm900QlGZfo+za2MCe9uaLozRuEWm6IUT+fV3kl+uy22xHf4KN0AMC5ieT3t7FrJekXseBi8uBu9cEwqz6FScUUZjDQ92sH0djJ3z+4jCB+5N9xEyJ2rd5U0AdbaZGXMuVdqQzG8dh7qv79R5w3p3IfawbX1dksX1TQe2nWHsMKukN1rHyAQOGnQ8sv6ougrnv/UxfRoy/n45E6bYHilWx+oGnVW3rtWh8N3RYD9dr8qCw1zR5HgLm3oeiSkqIjJPgCY04wBR2xK4QzqxNQQ== cardno:13 409 759"
        ];
      };
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
  programs.fish.enable = true;
}