{
  description = "cozy's NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: {
    nixosConfigurations = {
      # skaianet - my home PC
      skaianet = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/skaianet/default.nix
          ./hosts/common/core.nix
          home-manager.nixosModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.cozygalvinism = {
              imports = [
                ./home/common/base.nix
                ./home/skaianet/gui.nix
              ];
            };
          }
        ];
      };

      vmnix = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/vmnix/default.nix
          ./hosts/common/core.nix
          home-manager.nixosModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.cozygalvinism = {
              imports = [
                ./home/common/base.nix
              ];
            };
          }
        ];
      };

      # more machines here
    };
  };
}