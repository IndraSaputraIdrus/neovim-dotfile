return {
	"stevearc/conform.nvim",
	dependencies = { "mason.nvim" },
	lazy = true,
	cmd = "ConformInfo",
	keys = {
		{
			"<leader>fm",
			function()
				require("conform").format()
				print("formatting")
			end,
			mode = { "n", "v" },
			desc = "Format Injected Langs",
		},
	},
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			svelte = { "prettierd" },
			typescript = { "prettierd" },
			javascript = { "prettierd" },
			typescriptreact = { "prettierd" },
			javascriptreact = { "prettierd" },
		},
	},
}
