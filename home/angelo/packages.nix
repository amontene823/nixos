{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # CLI basics
    wget
    curl
    htop
    rclone
    unzip
    tree
    wl-clipboard

    # dev tools (user-scoped)
    gh
    uv
    python3

    # editors (optional: keep in NixOS if you want them system-wide)
    # vim-full
    # emacs
  ];
}
