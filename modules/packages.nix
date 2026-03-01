{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    vim-full
    wl-clipboard
    wget
    git
    openssh
    curl
    htop
    rclone
    unzip

    vim
    emacs
    ispell
    vscode
    gh

    # python
    python3
    uv

    stm32cubemx
    stm32flash

    # CAD
    kicad
    openscad
    freecad
    turbocase
    easyeda2kicad

    # C/C++ build tools
    gcc
    gnumake
    cmake
    libtool
    ninja

    # Gaming / emulation
    retroarch-full
    dolphin-emu

    # Utilities
    kdePackages.bluedevil
    maliit-keyboard
  ];
}
