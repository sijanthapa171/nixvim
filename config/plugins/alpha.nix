{
  plugins = {
    alpha = {
      enable = true;
      layout = [
        {
          type = "padding";
          val = 4;
        }
        {
          type = "text";
          val = [
            "███╗   ██╗██╗██╗  ██╗██╗   ██╗██╗███╗   ███╗"
            "████╗  ██║██║╚██╗██╔╝██║   ██║██║████╗ ████║"
            "██╔██╗ ██║██║ ╚███╔╝ ██║   ██║██║██╔████╔██║"
            "██║╚██╗██║██║ ██╔██╗ ╚██╗ ██╔╝██║██║╚██╔╝██║"
            "██║ ╚████║██║██╔╝ ██╗ ╚████╔╝ ██║██║ ╚═╝ ██║"
            "╚═╝  ╚═══╝╚═╝╚═╝  ╚═╝  ╚═══╝  ╚═╝╚═╝     ╚═╝"
          ];
          opts = {
            position = "center";
            hl = "Type";
          };
        }
        {
          type = "padding";
          val = 2;
        }
        {
          opts = {
            hl = "AlphaButtons";
            position = "center";
            spacing = 1;
          };
          type = "group";
          val = let
            mkButton = shortcut: val: cmd: on_press: {
              type = "button";
              inherit val;
              on_press.__raw = ''
                function()
                  local keys = vim.api.nvim_replace_termcodes('<leader>${shortcut}', true, false, true)
                  vim.api.nvim_feedkeys(keys, 'm', false)
                end
              '';
              opts = {
                keymap = [
                  "n"
                  "<leader>${shortcut}"
                  cmd
                  # {}
                  {
                    noremap = true;
                    silent = true;
                    nowait = true;
                    desc = val;
                  }
                ];
                shortcut = "SPC ${shortcut}";
                position = "center";
                cursor = 3;
                width = 40;
                align_shortcut = "right";
                # hl = "AlphaButtons";
                hl_shortcut = "Keyword";
              };
            };
          in [
            (
              mkButton
              "ff"
              "󰈞  Find file"
              "<CMD>lua require('telescope.builtin').find_files()<CR>"
              "require('telescope.builtin').find_files()"
            )
            (
              mkButton
              "fn"
              "  New file"
              # "  New file"
              ":ene <BAR> startinsert<CR>"
              "vim.cmd(\"ene | startinsert\")"
            )
            (
              mkButton
              "fr"
              "󰊄  Recently used files"
              "<CMD>lua require('telescope.builtin').oldfiles()<CR>"
              "require('telescope.builtin').oldfiles()"
            )
            (
              mkButton
              "fg"
              "󰈬  Live grep"
              "<CMD>lua require('telescope.builtin').live_grep()<CR>"
              "require('telescope.builtin').live_grep()"
            )
            # (
            #   mkButton
            #   "cf"
            #   "  Configuration"
            #   "<CMD>e ~/NixOS/<CR>"
            #   "vim.cmd(\"e ~/NixOS/\")"
            # )
            (
              mkButton
              "rs"
              "  Restore last session"
              "<CMD>lua require('persistence').load()<CR>"
              "require('persistence').load()"
            )
            (
              mkButton
              "qq"
              "  Quit neovim"
              "<CMD>quitall<CR><esc>"
              "vim.cmd(\"quitall\")"
              # "󰅚  Quit Neovim"
            )
          ];
        }
        {
          type = "padding";
          val = 2;
        }
        {
          type = "text";
          val = "Better than neovim.";
          opts = {
            position = "center";
            # hl = "Keyword";
            hl = "AlphaButtons";
          };
        }
      ];
    };
  };
}
