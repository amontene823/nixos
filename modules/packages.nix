{ pkgs, ... }:

{
  # System-wide packages
  environment.systemPackages = with pkgs; [

    # CLI basics
    wget
    curl
    htop
    wl-clipboard


    # Editors/GUI
    vim-full

    # Device/tools / system-ish
    openssh

    # Build tools
    gcc
    gnumake
    cmake
    libtool
    ninja
  ];
}
