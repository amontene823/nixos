{ config, pkgs, ... }:

let
  tex = pkgs.texliveMedium.withPackages (ps: with ps; [
    # org-mode latex preview/export helpers
    latexmk
    dvisvgm
    dvipng

    # your existing needs
    wrapfig
    amsmath
    ulem
    hyperref
    capt-of

    # missing packages from your log
    cleveref
    hypcap
    tools
    tocloft
    dirtytalk
    needspace
    enumitem
  ]);
in
{
  home.packages = [ tex ];
}
