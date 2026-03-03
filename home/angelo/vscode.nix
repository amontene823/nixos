{ pkgs, ... }:

let
  extensions = with pkgs.vscode-extensions; [
    # Keep this list focused on editor behavior that should be reproducible.
    # dracula-theme.theme-dracula
  ];
in
{
  programs.vscode = {
    enable = true;
    inherit extensions;
  };
}
