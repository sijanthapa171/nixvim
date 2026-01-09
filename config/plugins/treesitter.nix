{ ... }:
{
  plugins = {
    treesitter-context.enable = false;
    treesitter = {
      enable = true;
      nixvimInjections = true;
      nixGrammars = true;
      folding.enable = false;
      settings = {
        indent.enable = true;
        # incremental_selection.enable = true;
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
        grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
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
