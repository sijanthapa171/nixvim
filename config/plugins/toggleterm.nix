{
  plugins.toggleterm = {
    enable = true;
    settings = {
      direction = "float"; # float, horizontal, vertical, tab
      start_in_insert = true;
      open_mapping = "[[<M-f>]]";
      autochdir = true;
      size = 12;
      float_opts = {
        border = "rounded";
        width = 150; # 155
        height = 33; # 35
      };
    };
  };
}
