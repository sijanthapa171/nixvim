{pkgs, ...}: {
  extraPlugins = [
    (pkgs.vimUtils.buildVimPlugin {
      name = "presence";
      src = pkgs.fetchFromGitHub {
        owner = "andweeb";
        repo = "presence.nvim";
        rev = "87c857a56b7703f976d3a5ef15967d80508df6e6";
        hash = "sha256-ZpsunLsn//zYgUtmAm5FqKVueVd/Pa1r55ZDqxCimBk=";
      };
    })
  ];
}
