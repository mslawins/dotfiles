local null_ls = require('null-ls')

-- builtins: https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins

local lua_format_extra_args = {
  '--column-limit=120',
  '--indent-width=2',
  '--continuation-indent-width=2',
  '--extra-sep-at-table-end',
  '--chop-down-table',
  '--chop-down-kv-table',
  '--spaces-inside-table-braces',
  '--double-quote-to-single-quote',
  '--no-keep-simple-function-one-line',
  '--no-keep-simple-control-block-one-line',
}

null_ls.setup({
  sources = {
    null_ls.builtins.diagnostics.eslint_d,
    null_ls.builtins.formatting.prettier,
    null_ls.builtins.formatting.lua_format.with({ extra_args = lua_format_extra_args }),
  },
  on_attach = function()
    -- auto format file on save
    vim.cmd('autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()')
  end,
})
