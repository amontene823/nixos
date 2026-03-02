{ ... }:

{
  programs.git = {
    enable = true;

    userName = "Angelo Montenegro";
    userEmail = "amontene823@gmail.com";

    extraConfig = 
      init.defaultBranch = "main";
      pull.rebase = false;
      push.autoSetupRemote = true;
      fetch.prune = true;
      rerere.enabled = true;
    };

    aliases = {
      st = "status";
      co = "checkout";
      br = "branch";
      ci = "commit";
      lg = "log --oneline --decorate --graph --all";
    };
  };
}
