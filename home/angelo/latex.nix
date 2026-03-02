{ config, pkgs, ... }:
let
  tex = (pkgs.texliveMedium.withPackages (
    ps: with ps; [
      dvisvgm dvipng # for preview and export as html
      wrapfig amsmath ulem hyperref capt-of
      #(setq org-latex-compiler "lualatex")
      #(setq org-preview-latex-default-process 'dvisvgm)
  ]));
in
{ # home-manager
  home.packages = with pkgs; [
    tex
  ];
}
