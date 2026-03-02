{ config, pkgs, ... }:

let
  # Opens default browser on WSL (Windows host) via wslview
  xdgOpenToWindows = pkgs.writeShellScriptBin "xdg-open" ''
    exec ${pkgs.wslu}/bin/wslview "$@"
  '';
in
{
  networking.hostName = "wsl";
  wsl.enable = true;

  # Optional: set the default WSL user (match your username)
  wsl.defaultUser = "angelo";

  environment.systemPackages = with pkgs; [
    wslu               # provides wslview
    xdgOpenToWindows   # overrides xdg-open in PATH
  ];

  environment.sessionVariables = {
    BROWSER = "${pkgs.wslu}/bin/wslview";
  };

  # If your user module already creates user "angelo", you may not need anything else here.
  system.stateVersion = "25.11";
}
