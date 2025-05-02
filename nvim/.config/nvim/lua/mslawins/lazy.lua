local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	-- lua plugins "standard library"
	"nvim-lua/plenary.nvim",
	"MunifTanjim/nui.nvim",

	-- colorschemes & icons
	"luisiacc/gruvbox-baby",
  "ellisonleao/gruvbox.nvim",
	"kyazdani42/nvim-web-devicons",
	"norcalli/nvim-colorizer.lua",

	-- treesitter
	{ "nvim-treesitter/nvim-treesitter", cmd = "TSUpdate" },

	-- buffer line & status line
	"romgrk/barbar.nvim",
	"nvim-lualine/lualine.nvim",

	-- file navigation
	"nvim-telescope/telescope.nvim",
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	"kyazdani42/nvim-tree.lua",
	{ "ThePrimeagen/harpoon", branch = "harpoon2", dependencies = { "nvim-lua/plenary.nvim" } },

	-- comments
	"terrortylor/nvim-comment",
	"JoosepAlviste/nvim-ts-context-commentstring",
	"folke/todo-comments.nvim",

	-- LSP
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"neovim/nvim-lspconfig",
	"glepnir/lspsaga.nvim",

	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-nvim-lua",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-cmdline",
	"saadparwaiz1/cmp_luasnip",

	"mfussenegger/nvim-lint",
	{ "stevearc/conform.nvim", opts = {} },

	-- snippets
	"L3MON4D3/LuaSnip",
	"benfowler/telescope-luasnip.nvim",

	-- autopairs & matching tags in html
	"windwp/nvim-autopairs",
	"leafOfTree/vim-matchtag",

	-- AI
	"jackMort/ChatGPT.nvim",

	-- be better at vim
	{ "m4xshen/hardtime.nvim", dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" } },
	"tris203/precognition.nvim",

	-- other
	"airblade/vim-rooter",
	"simrat39/rust-tools.nvim",
	"mattn/emmet-vim",
	"f-person/git-blame.nvim",
	"ellisonleao/glow.nvim",
	"chrishrb/gx.nvim",
})
