{pkgs, ...}: {
  colorschemes.onedark = {
    enable = true;
    # use the nvim variant instead of the vim variant
    # The nvim variant is also treesitter enabled
    package = pkgs.vimPlugins.onedark-nvim;
  };
}
