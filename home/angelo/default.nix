{ config, pkgs, ... }:

{
  # Set this to match your system.stateVersion (check in /etc/nixos/hosts/nomad/configuration.nix).
  # Example values are "24.11", "25.05", etc.
  home.stateVersion = "25.11";

  xdg.enable = true;

  imports = [
    ./packages.nix
    ./git.nix
    ./bash.nix
    ./direnv.nix
    ./latex.nix
  ];
}
