{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.terminal;
in
{
  config = lib.mkIf cfg.enableGit {
    programs.gpg.enable = true;
    programs.git = {
      enable = true;
      settings = {
        init.defaultbranch = "main";
        user.name = "AarynSmith";
        user.email = "4387096+AarynSmith@users.noreply.github.com";
        user.signingKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAlElxioTwGZpGuxlFOyF/JpaPulFc83B5DCViHML76s";
        gpg.format = "ssh";
        commit.gpgsign = true;
        commit.verbose = true;
        core.autocrlf = "input";
        filter.lfs.clean = "git-lfs clean -- %f";
        filter.lfs.smudge = "git-lfs smudge -- %f";
        filter.lfs.process = "git-lfs filter-process";
        filter.lfs.required = true;
        core.repositoryformatversion = 0;
        core.filemode = true;
        core.bare = false;
        core.logallrefupdates = true;
        core.ignorecase = true;
        core.precomposeunicode = true;
      };
    };
  };
}
