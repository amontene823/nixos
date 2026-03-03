{ pkgs, ... }:

let
  cliTools = with pkgs; [
    rclone
    unzip
    tree
    ispell
    ripgrep
    fd
  ];

  devTools = with pkgs; [
    gh
    uv
    python3
  ];

  stm32Tools = with pkgs; [
    stm32cubemx
    stm32flash
  ];

  cadTools = with pkgs; [
    kicad
    openscad
    freecad
    turbocase
    easyeda2kicad
  ];

  electronicsTools = with pkgs; [
    kingstvis
  ];

  editorTools = with pkgs; [
    emacs
  ];

  fontPackages = with pkgs; [
    fira-code
    cantarell-fonts
  ];
in
{
  # User-scoped packages.
  home.packages =
    cliTools
    ++ devTools
    ++ stm32Tools
    ++ cadTools
    ++ electronicsTools
    ++ editorTools
    ++ fontPackages;


  fonts.fontconfig.enable = true;
}
