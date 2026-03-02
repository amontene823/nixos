{ pkgs, ... }:

{
  # User-scoped pacckages
  home.packages = with pkgs; [
    # CLI tools
    rclone
    unzip
    tree
    ispell

    # dev tools
    gh
    uv
    python3

    # STM32
    stm32cubemx
    stm32flash

    # CAD
    kicad
    openscad
    freecad
    turbocase
    easyeda2kicad

    # Editors
    emacs
    vscode

    # Fonts
    fira-code
    cantarell-fonts

    # Gaming / emulation
    retroarch-full
    dolphin-emu

  ];


  fonts.fontconfig.enable = true;
}
