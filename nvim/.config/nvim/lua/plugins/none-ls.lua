return {
  'nvimtools/none-ls.nvim',
  dependencies = {
    'nvimtools/none-ls-extras.nvim',
  },
  config = function()
    local null_ls = require 'null-ls'
    local formatting = null_ls.builtins.formatting -- to setup formatters
    local diagnostics = null_ls.builtins.diagnostics -- to setup linters

    -- Tool installation is centralized in lsp.lua.
    local sources = {
      diagnostics.checkmake,
      formatting.prettier.with { filetypes = { 'html', 'json', 'yaml', 'markdown' } },
      formatting.stylua,
      formatting.shfmt.with { args = { '-i', '4' } },
      -- Only use ruff_format for Python formatting
      require('none-ls.formatting.ruff_format').with {
        extra_args = {},
      },
    }

    local augroup = vim.api.nvim_create_augroup('LspFormatting', {})
    null_ls.setup {
      -- debug = true, -- Enable debug mode. Inspect logs with :NullLsLog.
      sources = sources,
      -- you can reuse a shared lspconfig on_attach callback here
      on_attach = function(client, bufnr)
        if client.supports_method 'textDocument/formatting' then
          vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
          vim.api.nvim_create_autocmd('BufWritePre', {
            group = augroup,
            buffer = bufnr,
            callback = function()
              -- Format with specific client filtering
              vim.lsp.buf.format {
                async = false,
                filter = function(format_client)
                  -- For Python files, only use none-ls (which uses ruff_format)
                  if vim.bo.filetype == 'python' then
                    return format_client.name == 'null-ls'
                  end
                  -- For other files, use any available formatter
                  return true
                end,
              }
            end,
          })
        end
      end,
    }
  end,
}
