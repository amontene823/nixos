{ config, pkgs, ... }:

{
  networking.hostName = "wsl";
  wsl.enable = true;

  # Optional: set the default WSL user (match your username)
  wsl.defaultUser = "angelo";

  environment.systemPackages = with pkgs; [
    firefox
  ];

  # If your user module already creates user "angelo", you may not need anything else here.
  system.stateVersion = "25.11";
}
