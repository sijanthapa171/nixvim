{
  autoGroups = {
    "YankHighlight" = {clear = true;};
    "bufcheck" = {clear = true;};
    "large_buf" = {clear = true;};
    "close-with-q" = {clear = true;};
    "auto_open_nvimtree" = {clear = true;};
    "alpha_autostart" = {clear = true;};
    "wrap_spell" = {clear = true;};
    "terminal_settings" = {clear = true;};
    "UserLspConfig" = {};
  };
  autoCmd = [
    {
      event = "TextYankPost";
      group = "YankHighlight";
      pattern = "*";
      callback = {
        __raw = ''
          function()
            vim.highlight.on_yank({
              higroup = 'IncSearch',
              timeout = 40,
            })
          end
        '';
      };
    }
    {
      event = ["TermOpen" "TermEnter"];
      group = "terminal_settings";
      pattern = "term://*";
      command = "startinsert!";
    }
    {
      event = "Filetype";
      group = "close-with-q";
      pattern = [
        "PlenaryTestPopup"
        "help"
        "lspinfo"
        "man"
        "notify"
        "qf"
        "query"
        "spectre_panel"
        "startuptime"
        "tsplayground"
        "neotest-output"
        "checkhealth"
        "neotest-summary"
        "neotest-output-panel"
      ];
      callback = {
        __raw = ''
          function(data)
            vim.bo[data.buf].buflisted = false
            vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = data.buf, silent = true })
          end
        '';
      };
    }
    {
      event = "FileType";
      group = "wrap_spell";
      pattern = [
        "gitcommit"
        "markdown"
      ];
      callback = {
        __raw = ''
          function()
            vim.opt_local.wrap = true
            vim.opt_local.spell = true
          end
        '';
      };
    }
    {
      event = "VimEnter";
      group = "alpha_autostart";
      callback = {
        __raw = ''
          function()
            local should_skip
            if
                vim.fn.argc() > 0
            then
              vim.cmd("wincmd l")
              vim.cmd("wincmd k")
              should_skip = true
            else
              for _, arg in pairs(vim.v.argv) do
                if arg == "-b" or arg == "-c" or vim.startswith(arg, "+") or arg == "-S" then
                  should_skip = true
                  break
                end
              end
            end
            if should_skip then return end
          end
        '';
      };
    }
    {
      event = "VimEnter";
      group = "auto_open_nvimtree";
      callback = {
        __raw = ''
          function(data)
            -- buffer is a directory
            local directory = vim.fn.isdirectory(data.file) == 1

            if not directory then
              return
            end

            -- change to the directory
            vim.cmd.cd(data.file)

            -- open the tree
            require("nvim-tree.api").tree.open()
          end
        '';
      };
    }
  ];
}
