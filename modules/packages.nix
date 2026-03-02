{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Editors/GUI you want system-wide (keep or move later)
    vim-full
    vim
    emacs
    ispell
    vscode

    # Device/tools / system-ish
    openssh
    stm32cubemx
    stm32flash

    # CAD
    kicad
    openscad
    freecad
    turbocase
    easyeda2kicad

    # Build tools (either place; keeping system-wide is fine)
    gcc
    gnumake
    cmake
    libtool
    ninja

    # Gaming / emulation
    retroarch-full
    dolphin-emu

    # KDE/desktop utilities
    kdePackages.bluedevil
    maliit-keyboard
  ];
}
