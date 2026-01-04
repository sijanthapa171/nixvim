{pkgs, ...}: {
  # Presenting.vim - Slides presentation in Neovim
  # Create markdown files with slide separators (# Slide Title) and present them
  # Usage:
  #   :PresentingStart - Start presentation mode
  #   n - Next slide
  #   p - Previous slide
  #   q - Quit presentation
  
  extraPlugins = with pkgs.vimPlugins; [
    presenting-vim
  ];
}
