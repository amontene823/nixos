{
  description = "Angelo's NixOS configurations";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # WSL integration
    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";
  };

  outputs = { self, nixpkgs, home-manager, nixos-wsl, ... }:
  let
    lib = nixpkgs.lib;

    mkHost =
      { system
      , hostName
      , extraModules ? [ ]
      , hasHardware ? true
      , enableDesktop ? false
      }:
      lib.nixosSystem {
        inherit system;
        modules =
          [
            ./modules/base.nix
            ./modules/packages.nix
            ./modules/user-angelo.nix

            # Home Manager (user environment)
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.extraSpecialArgs = {
                inherit hostName;
              };
              home-manager.users.angelo = import ./home/angelo;
            }

            # Host-specific bits
            ./hosts/${hostName}/configuration.nix
          ]
          ++ lib.optionals enableDesktop [
            ./modules/desktop.nix
          ]
          ++ lib.optionals hasHardware [
            ./hosts/${hostName}/hardware-configuration.nix
          ]
          ++ extraModules;
      };
  in
  {
    nixosConfigurations = {
      # “Real” machine: enableDesktop = true
      nomad = mkHost {
        system = "x86_64-linux";
        hostName = "nomad";
        enableDesktop = true;
      };

      # WSL host: no hardware config, no desktop module
      wsl = mkHost {
        system = "x86_64-linux";
        hostName = "wsl";
        hasHardware = false;
        enableDesktop = false;
        extraModules = [
          nixos-wsl.nixosModules.default
        ];
      };
    };
  };
}
