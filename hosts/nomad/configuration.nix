{ config, pkgs, ... }:

{
  networking.hostName = "nomad";
  system.stateVersion = "25.11";
}
