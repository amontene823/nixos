{
  description = "Angelo's NixOS configurations";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, ... }:
    let
      lib = nixpkgs.lib;

      mkHost = { system, hostName }:
        lib.nixosSystem {
          inherit system;
          modules = [
            ./modules/common.nix
            ./modules/desktop-kde.nix
            ./modules/packages.nix
            ./modules/user-angelo.nix

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
