{
  description = "Angelo's NixOS configurations";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }:
    let
      lib = nixpkgs.lib;

      mkHost = { system, hostName }:
        lib.nixosSystem {
          inherit system;
          modules = [
            ./modules/common.nix
            ./modules/packages.nix
            ./modules/user-angelo.nix

            # Home Manager (user environment)
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.angelo = import ./home/angelo;
            }

            # Host-specific bits (hostname + hardware)
            ./hosts/${hostName}/configuration.nix
            ./hosts/${hostName}/hardware-configuration.nix
          ];
        };
    in
    {
      nixosConfigurations = {
        nomad = mkHost { system = "x86_64-linux"; hostName = "nomad"; };
      };
    };
}
