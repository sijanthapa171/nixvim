{ ... }:
{
  keymaps = [
    {
      mode = [
        "x"
        "o"
      ];
      key = "af";
      action = ''<cmd>lua require "nvim-treesitter-textobjects.select".select_textobject("@function.outer", "textobjects")<cr>'';
    }
    {
      mode = [
        "x"
        "o"
      ];
      key = "if";
      action = ''<cmd>lua require "nvim-treesitter-textobjects.select".select_textobject("@function.inner", "textobjects")<cr>'';
    }
    {
      mode = [
        "x"
        "o"
      ];
      key = "ac";
      action = ''<cmd>lua require "nvim-treesitter-textobjects.select".select_textobject("@class.outer", "textobjects")<cr>'';
    }
    {
      mode = [
        "x"
        "o"
      ];
      key = "ic";
      action = ''<cmd>lua require "nvim-treesitter-textobjects.select".select_textobject("@class.inner", "textobjects")<cr>'';
    }
    {
      mode = [
        "x"
        "o"
      ];
      key = "as";
      action = ''<cmd>lua require "nvim-treesitter-textobjects.select".select_textobject("@local.scope", "locals")<cr>'';
    }
    {
      mode = [
        "x"
        "o"
      ];
      key = "aa";
      action = ''<cmd>lua require("nvim-treesitter-textobjects.select").select_textobject("@parameter.outer", "textobjects")<cr>'';
    }
    {
      mode = [
        "x"
        "o"
      ];
      key = "ia";
      action = ''<cmd>lua require("nvim-treesitter-textobjects.select").select_textobject("@parameter.inner", "textobjects")<cr>'';
    }
    {
      mode = [
        "x"
        "o"
      ];
      key = "ai";
      action = ''<cmd>lua require("nvim-treesitter-textobjects.select").select_textobject("@conditional.outer", "textobjects")<cr>'';
    }
    {
      mode = [
        "x"
        "o"
      ];
      key = "ii";
      action = ''<cmd>lua require("nvim-treesitter-textobjects.select").select_textobject("@conditional.inner", "textobjects")<cr>'';
    }
    {
      mode = [
        "x"
        "o"
      ];
      key = "at";
      action = ''<cmd>lua require("nvim-treesitter-textobjects.select").select_textobject("@comment.outer", "textobjects")<cr>'';
    }
  ];
  extraConfigLua = ''
    require("nvim-treesitter-textobjects").setup {
      select = {
        lookahead = true,
        selection_modes = {
          -- ['@parameter.outer'] = 'v', -- charwise
          -- ['@function.outer'] = 'V', -- linewise
          -- ['@class.outer'] = '<c-v>', -- blockwise
        },
        include_surrounding_whitespace = false,
      },
    }
  '';
  plugins = {
    treesitter-textobjects = {
      enable = true;
      # settings = {
      #   select = {
      #     enable = true;
      #     lookahead = true;
      #     include_surrounding_whitespace = true;
      #     selection_modes = {
      #       "@comment.outer" = "V";
      #     };
      #   };
      # };
    };
    treesitter = {
      enable = true;
      nixvimInjections = true;
      nixGrammars = true;
      folding.enable = false;
      settings = {
        indent.enable = true;
        incremental_selection = {
          enable = true;
          keymaps = {
            scope_incremental = false;
            init_selection = "<C-space>";
            node_incremental = "<C-space>";
            node_decremental = "<bs>";
          };
        };
      };

      /*
        grammarPackages = with config.plugins.treesitter.package.builtGrammars; [
          nix
          bash
          cmake
          make
          python
          rust
          c
          c_sharp
          cpp
          regex
          gitcommit
          gitignore
          markdown
          markdown_inline
          json
          lua
          toml
          yaml
          zig
        ];
      */
    };
  };
}
