{ config, pkgs, ... }:

{
  imports = [
    ../../modules/desktop-kde.nix
  ];

  networking.hostName = "nomad";
  system.stateVersion = "25.11";
}
