local lspconfig = require('lspconfig')
local cmp = require('cmp')
local luasnip = require('luasnip')

require('luasnip.loaders.from_lua').load({ paths = '~/.config/nvim/lua/mslawins/snippets' })

local check_backspace = function()
  local col = vim.fn.col('.') - 1
  return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s')
end

local buf_map = function(bufnr, mode, lhs, rhs, opts)
  vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts or { silent = true })
end

local on_attach = function(client, bufnr)
  vim.cmd('command! LspDef lua vim.lsp.buf.definition()')
  vim.cmd('command! LspFormatting lua vim.lsp.buf.formatting()')
  vim.cmd('command! LspRename lua vim.lsp.buf.rename()')

  buf_map(bufnr, 'n', 'gd', ':LspDef<CR>')
  buf_map(bufnr, 'n', 'rs', ':LspRename<CR>')
  buf_map(bufnr, 'n', 'ff', ':LspFormatting<CR>')

  -- formatting is set via null-ls, hence default tsserver formatting has to be off
  -- if client.name == 'tsserver' then
  client.resolved_capabilities.document_formatting = false
  -- end
end

cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },

  mapping = {
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expandable() then
        luasnip.expand()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif check_backspace() then
        fallback()
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

  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'path' },
    { name = 'buffer', keyword_length = 5 },
    { name = 'cmdline' },
    { name = 'nvim_lua' },
  },

  experimental = { native_menu = false },
})

require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

lspconfig.tsserver.setup({ on_attach = on_attach })
lspconfig.sumneko_lua.setup({
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Setup your lua path
        path = vim.split(package.path, ';'),
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { 'vim' },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = { [vim.fn.expand('$VIMRUNTIME/lua')] = true, [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true },
      },
    },
  },
  on_attach = on_attach,
})
lspconfig.angularls.setup({})
lspconfig.rust_analyzer.setup({})
require('rust-tools').setup({
  server = {
    on_attach = function()
      -- auto format file on save
      vim.cmd('autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()')
    end,

  },
})

-- lspconfig.vls.setup({})
lspconfig.volar.setup({})
