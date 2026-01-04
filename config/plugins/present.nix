{pkgs, ...}: {
  # Presenting.vim - Slides presentation in Neovim
  # Create markdown files with slide separators (# Slide Title) and present them
  # Usage:
  #   :PresentingStart - Start presentation mode
  #   Ctrl+Shift+p - Start presentation mode (keybinding)
  #   n - Next slide
  #   p - Previous slide
  #   q - Quit presentation
  
  extraPlugins = with pkgs.vimPlugins; [
    presenting-vim
  ];
  
  # Keybinding to start presentation with Ctrl+Shift+p
  keymaps = [
    {
      mode = "n";
      key = "<C-S-p>";
      action = ":PresentingStart<CR>";
      options = {
        desc = "Start presentation mode";
        silent = true;
      };
    }
  ];
}
