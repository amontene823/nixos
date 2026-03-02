{ ... }:

{
  programs.git = {
    enable = true;

    settings = {
      user = {
        name = "Angelo Montenegro";
        email = "amontene823@gmail.com";
      };

      init.defaultBranch = "main";
      pull.rebase = false;
      push.autoSetupRemote = true;
      fetch.prune = true;
      rerere.enabled = true;

      alias = {
        st = "status";
        co = "checkout";
        br = "branch";
        ci = "commit";
        lg = "log --oneline --decorate --graph --all";
      };

      # Line ending policy for Linux
      core = {
        autocrlf = "input";
        eol = "lf";
        safecrlf = "warn";
      };
    };
  };
}
