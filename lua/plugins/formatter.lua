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
		formatters = {
			prettier = {
				require_cwd = true,
			},
			biome = {
				require_cwd = true,
			},
		},
		formatters_by_ft = {
			lua = { "stylua" },
			svelte = { "prettierd" },
			typescript = { "biome" },
			javascript = { "biome" },
			typescriptreact = { "prettierd" },
			javascriptreact = { "prettierd" },
			css = { "biome" },
		},
	},
}
