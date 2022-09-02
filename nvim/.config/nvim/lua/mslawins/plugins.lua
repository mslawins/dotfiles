require 'paq' {
  -- package manager & lua plugins "standard library"
  'savq/paq-nvim',
  'nvim-lua/plenary.nvim',

  -- colorschemes & icons
  'ellisonleao/gruvbox.nvim',
  'luisiacc/gruvbox-baby',
  'sainnhe/gruvbox-material',
  'kyazdani42/nvim-web-devicons',

  -- treesitter
  {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      require('nvim-treesitter.install').update({ with_sync = true })
    end,
  },

  -- buffer line & status line 
  'romgrk/barbar.nvim',
  'nvim-lualine/lualine.nvim',

  -- file navigation
  'nvim-telescope/telescope.nvim',
  { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
  'kyazdani42/nvim-tree.lua',
  'ThePrimeagen/harpoon',

  -- comments
  'terrortylor/nvim-comment',
  'folke/todo-comments.nvim',

  -- other
  'airblade/vim-rooter',
  'simrat39/rust-tools.nvim',
  'mattn/emmet-vim',
  'f-person/git-blame.nvim',

  -- LSP 
  'williamboman/mason.nvim',
  'neovim/nvim-lspconfig',

  'hrsh7th/nvim-cmp',
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-cmdline',

  'jose-elias-alvarez/null-ls.nvim',

  -- snippets
  'hrsh7th/vim-vsnip',
  'hrsh7th/vim-vsnip-integ',
  'L3MON4D3/LuaSnip',
  -- 'Shougo/neosnippet.vim';
}

require('nvim-treesitter.configs').setup {
  ensure_installed = { 'typescript', 'javascript', 'rust', 'lua', 'html', 'scss', 'css' },
  sync_install = false,
  auto_install = true,
  highlight = { enable = true },
}

local actions = require('telescope.actions')
local action_state = require('telescope.actions.state')

local function fzf_multi_select(prompt_bufnr)
  local picker = action_state.get_current_picker(prompt_bufnr)
  local num_selections = table.getn(picker:get_multi_selection())

  if num_selections > 1 then
    -- local picker = action_state.get_current_picker(prompt_bufnr)
    for _, entry in ipairs(picker:get_multi_selection()) do
      vim.cmd(string.format('%s %s', ':e!', entry.value))
    end
    vim.cmd('stopinsert')
  else
    actions.file_edit(prompt_bufnr)
  end
end

require('telescope').setup {
  defaults = { mappings = { i = { ['<esc>'] = actions.close, ['<cr>'] = fzf_multi_select } } },

  -- faster fuzzy search
  extensions = {
    fzf = { fuzzy = true, override_generic_sorter = true, override_file_sorter = true, case_mode = 'smart_case' },
  },
}
require('telescope').load_extension('fzf')
require('telescope').load_extension('harpoon')

require('nvim_comment').setup({ create_mappings = false })

require('nvim-tree').setup({ view = { width = 60 } })

require('lualine').setup({ options = { theme = 'gruvbox_dark' } })

-- bufferline + nvim-tree
local nvim_tree_events = require('nvim-tree.events')
local bufferline_state = require('bufferline.state')

local function get_tree_size()
  return require'nvim-tree.view'.View.width
end

nvim_tree_events.subscribe('TreeOpen', function()
  bufferline_state.set_offset(get_tree_size())
end)

nvim_tree_events.subscribe('Resize', function()
  bufferline_state.set_offset(get_tree_size())
end)

nvim_tree_events.subscribe('TreeClose', function()
  bufferline_state.set_offset(0)
end)

require('todo-comments').setup()

vim.g.gitblame_enabled = 0

require('mason').setup()
