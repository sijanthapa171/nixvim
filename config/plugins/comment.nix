{pkgs, ...}: {
  extraPlugins = with pkgs.vimPlugins; [
    comment-nvim
  ];
  extraConfigLua = ''
    local comment = require("Comment")
    comment.setup({
      toggler = {
        line = 'gcc', ---Line-comment toggle keymap
        block = 'gbc', ---Block-comment toggle keymap
      },
      opleader = {
        line = 'gc', ---Line-comment keymap
        block = 'gb', ---Block-comment keymap
      },
      extra = {
        above = 'gcO', ---Add comment on the line above
        below = 'gco', ---Add comment on the line below
        eol = 'gcA', ---Add comment at the end of line
      },
    })
  '';
}
