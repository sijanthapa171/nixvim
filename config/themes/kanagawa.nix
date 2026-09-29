{ config, ... }:
{
  colorschemes.kanagawa = {
    enable = config.colorschemes.base16.enable != true;
    settings = {
      theme = "wave"; # wave, lotus, dragon, all
      transparent = false;
      # compile = false;
      dimInactive = false;
      functionStyle = { };
      terminalColors = true;
      undercurl = true;
      # colors.theme.all.ui = {
      #   bg_gutter = "none";
      # };
      commentStyle = {
        italic = true;
      };
    };
  };
}
