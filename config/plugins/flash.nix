{
  plugins.flash = {
    enable = true;
  };
  keymaps = [
    {
      mode = ["n" "x" "o"];
      action = "<CMD>lua require('flash').jump()<CR>";
      key = "s";
      options = {
        desc = "Flash";
        silent = true;
        noremap = true;
      };
    }
    {
      mode = ["n" "x" "o"];
      action = "<CMD>lua require('flash').treesitter()<CR>";
      key = "S";
      options = {
        desc = "Flash Treesitter";
        silent = true;
        noremap = true;
      };
    }
    {
      mode = ["o"];
      action = "<CMD>lua require('flash').remote()<CR>";
      key = "r";
      options = {
        desc = "Remote Flash";
        silent = true;
        noremap = true;
      };
    }
    {
      mode = ["o" "x"];
      action = "<CMD>lua require('flash').treesitter_search()<CR>";
      key = "R";
      options = {
        desc = "Treesitter Search";
        silent = true;
        noremap = true;
      };
    }
    {
      mode = ["c"];
      action = "<CMD>lua require('flash').toggle()<CR>";
      key = "<A-s>";
      options = {
        desc = "Toggle Flash Search";
        silent = true;
        noremap = true;
      };
    }
  ];
}
