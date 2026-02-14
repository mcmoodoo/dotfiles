-- Filetype detection overrides
-- DAML (Digital Asset Modeling Language) is Haskell-based; use Haskell syntax/indent/LSP
vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  pattern = '*.daml',
  callback = function()
    vim.bo.filetype = 'haskell'
  end,
})
