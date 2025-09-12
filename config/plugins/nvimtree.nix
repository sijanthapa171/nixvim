{
  keymaps = [
    {
      mode = "n";
      action = "<cmd>NvimTreeFindFileToggle<CR>";
      key = "<C-n>";
      options = {
        silent = true;
      };
    }
  ];
  plugins.nvim-tree = {
    enable = true;
    settings = {
      # autoClose = false;
      # openOnSetup = true;

      sync_root_with_cwd = true;
      respect_buf_cwd = true;
      update_focused_file = {
        enable = true;
        update_root = true;
      };
      git.enable = true;
      actions = {
        open_file.quit_on_open = true;
      };
      view = {
        side = "left";
        signcolumn = "no";
        preserve_window_proportions = true;
        float = {
          open_win_config = {
            col = 1;
            row = 1;
            relative = "editor";
            border = "rounded";
            #style = "minimal";
          };
        };
      };
    };
  };
}
