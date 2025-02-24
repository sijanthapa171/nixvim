{
  plugins.nvim-ufo = {
    enable = true;
    settings = {
      provider_selector = ''
        function(bufnr, filetype, buftype)
          return { 'lsp', 'indent' }
        end
      '';
      fold_virt_text_handler = ''
        function(virtText, lnum, endLnum, width, truncate)
            local newVirtText = {}
            local suffix = (' 󰁂 %d '):format(endLnum - lnum)
            local sufWidth = vim.fn.strdisplaywidth(suffix)
            local targetWidth = width - sufWidth
            local curWidth = 0
            for _, chunk in ipairs(virtText) do
                local chunkText = chunk[1]
                local chunkWidth = vim.fn.strdisplaywidth(chunkText)
                if targetWidth > curWidth + chunkWidth then
                    table.insert(newVirtText, chunk)
                else
                    chunkText = truncate(chunkText, targetWidth - curWidth)
                    local hlGroup = chunk[2]
                    table.insert(newVirtText, {chunkText, hlGroup})
                    chunkWidth = vim.fn.strdisplaywidth(chunkText)
                    -- str width returned from truncate() may less than 2nd argument, need padding
                    if curWidth + chunkWidth < targetWidth then
                        suffix = suffix .. (' '):rep(targetWidth - curWidth - chunkWidth)
                    end
                    break
                end
                curWidth = curWidth + chunkWidth
            end
            table.insert(newVirtText, {suffix, 'MoreMsg'})
            return newVirtText
        end
      '';
    };
  };
  extraConfigLua = ''
    -- Configuration for UFO folds
    -- require('ufo').setup({
    -- 	provider_selector = function(bufnr, filetype, buftype)
    -- 		return { 'lsp', 'indent' }
    -- 	end
    -- })
    vim.keymap.set('n', 'zR', require('ufo').openAllFolds, { desc = "Open all folds" })
    vim.keymap.set('n', 'zM', require('ufo').closeAllFolds, { desc = "Close all folds" })
    vim.keymap.set('n', 'zK', function()
    	local winid = require('ufo').peekFoldedLinesUnderCursor()
    	if not winid then
    		vim.lsp.buf.hover()
    	end
    end, { desc = "Peek Fold" })
  '';
}
