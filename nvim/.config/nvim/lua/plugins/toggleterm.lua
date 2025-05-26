return {
  'akinsho/toggleterm.nvim',
  version = '*',
  config = function()
    require('toggleterm').setup {
      size = 20,
      open_mapping = [[<C-\>]],
      start_in_insert = true,
      insert_mappings = true,
      persist_mode = true,
      persist_size = true,
      direction = 'horizontal', -- default
      shade_terminals = true,
    }

    -- Helper to create persistent terminals
    local Terminal = require('toggleterm.terminal').Terminal

    local horiz = Terminal:new { direction = 'horizontal', hidden = true }
    local vert = Terminal:new { direction = 'vertical', hidden = true }
    local float = Terminal:new { direction = 'float', hidden = true }
    local tab = Terminal:new { direction = 'tab', hidden = true }

    function _toggle_horizontal()
      horiz:toggle()
    end

    function _toggle_vertical()
      vert:toggle()
    end

    function _toggle_float()
      float:toggle()
    end

    function _toggle_tab()
      tab:toggle()
    end

    -- Keymaps
    local opts = { noremap = true, silent = true }

    -- Normal mode
    vim.keymap.set('n', '<A-1>', _toggle_horizontal, opts)
    vim.keymap.set('n', '<A-2>', _toggle_vertical, opts)
    vim.keymap.set('n', '<A-3>', _toggle_float, opts)
    vim.keymap.set('n', '<A-4>', _toggle_tab, opts)

    -- Terminal mode (escape to normal, then toggle)
    vim.keymap.set('t', '<A-1>', '<C-\\><C-n><cmd>lua _toggle_horizontal()<CR>', opts)
    vim.keymap.set('t', '<A-2>', '<C-\\><C-n><cmd>lua _toggle_vertical()<CR>', opts)
    vim.keymap.set('t', '<A-3>', '<C-\\><C-n><cmd>lua _toggle_float()<CR>', opts)
    vim.keymap.set('t', '<A-4>', '<C-\\><C-n><cmd>lua _toggle_tab()<CR>', opts)
  end,
}
