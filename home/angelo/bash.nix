{ ... }:

{
  programs.bash = {
    enable = true;
    enableCompletion = true;
  };

  home.shellAliases = {
    ll = "ls -lah";
    gs = "git status";
    ga = "git add";
    gc = "git commit";
    gco = "git checkout";
    gd = "git diff";
    v = "vim";
  };

  home.sessionVariables = {
    EDITOR = "vim";
  };

  # Optional: simple prompt tweak
  programs.bash.bashrcExtra = ''
    # nicer history behavior
    shopt -s histappend
    export HISTCONTROL=ignoredups:erasedups
    export HISTSIZE=50000
    export HISTFILESIZE=50000
  '';
}
