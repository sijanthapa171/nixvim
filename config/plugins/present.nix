{pkgs, ...}: {
  # ppt.nvim - Make PPT slides from markdown files in Neovim
  # Features:
  #   - Create presentations from markdown
  #   - Execute code blocks during presentation
  #   - Simple navigation
  # Usage:
  #   :PptStart - Start presentation mode
  #   Ctrl+Shift+p - Start presentation mode (keybinding)
  #   n - Next slide
  #   p - Previous slide
  #   X - Execute code block
  #   q or <Esc> - Quit presentation
  
  extraPlugins = [
    {
      plugin = pkgs.vimUtils.buildVimPlugin {
        name = "ppt.nvim";
        src = pkgs.fetchFromGitHub {
          owner = "kulvirdotgg";
          repo = "ppt.nvim";
          rev = "trunk";
          sha256 = "sha256-no0jTGfa/2kpUNWHC+/A+kBg1NF8fHtnSGLpU24ysnQ=";
        };
      };
      config = ''
        lua << EOF
        require("ppt").setup({
          executors = {
            python = "python3",
            javascript = "node",
            lua = "lua",
            bash = "bash",
            nix = "nix-instantiate --eval",
          },
        })
        EOF
      '';
    }
  ];
  
  # Keybinding to start presentation with Ctrl+Shift+p
  keymaps = [
    {
      mode = "n";
      key = "<C-S-p>";
      action = ":PptStart<CR>";
      options = {
        desc = "Start PPT presentation mode";
        silent = true;
      };
    }
  ];
}
