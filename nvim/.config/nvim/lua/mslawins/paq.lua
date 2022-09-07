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
  'windwp/nvim-autopairs',

  -- LSP 
  'williamboman/mason.nvim',
  'neovim/nvim-lspconfig',

  'hrsh7th/nvim-cmp',
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-nvim-lua',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-cmdline',
  'saadparwaiz1/cmp_luasnip',

  'jose-elias-alvarez/null-ls.nvim',

  -- snippets
  'L3MON4D3/LuaSnip',
  'benfowler/telescope-luasnip.nvim',
}
