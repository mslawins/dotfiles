require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		typescript = { "prettierd" },
		typescriptreact = { "prettierd" },
		vue = { "prettierd" },
		json = { "jq" },
		scss = { "prettierd" },
	},
	format_on_save = {
		timeout_ms = 500,
		lsp_format = "fallback",
	},
})
