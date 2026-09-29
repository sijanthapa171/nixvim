{ config, ... }:
{
  colorschemes.vague = {
    enable = config.colorschemes.base16.enable != true;
    settings = {
      transparent = false;
      # bold = false;
      # italic = false;
    };
  };
}
