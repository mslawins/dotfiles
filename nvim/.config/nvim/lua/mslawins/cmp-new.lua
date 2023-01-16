local cmp = require('cmp')
local luasnip = require('luasnip')
local lspconfig = require('lspconfig')
require('luasnip.loaders.from_lua').load({ paths = '~/.config/nvim/lua/mslawins/snippets' })

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
end

cmp.setup({
  mapping = {
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { 'i', 's' }),

    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  },
  sources = cmp.config.sources({ { name = 'nvim_lsp' }, { name = 'luasnip' } }, { { name = 'buffer' } }),
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()

lspconfig.angularls.setup({ capabilities = capabilities })
require('rust-tools').setup({
  capabilities = capabilities,
  server = {
    on_attach = function()
      -- auto format file on save
      vim.cmd('autocmd BufWritePre <buffer> lua vim.lsp.buf.format()')
    end,

  },
})
lspconfig.sumneko_lua.setup({
  settings = {
    Lua = {
      runtime = { version = 'LuaJIT', path = vim.split(package.path, ';') },
      diagnostics = { globals = { 'vim' } },
      workspace = {
        library = { [vim.fn.expand('$VIMRUNTIME/lua')] = true, [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true },
      },
    },
  },
})
lspconfig.tsserver.setup({ capabilities = capabilities })

lspconfig.volar.setup({
  capabilities = capabilities,
  typescript = { tsdk = '/User/msw/.local/share/nvim/mason/typescript-language-server' },
  on_attach = function(client)
    -- formating is done via null-ls
    client.server_capabilities.documentFormattingProvider = false
  end
})
