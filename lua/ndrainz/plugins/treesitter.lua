return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		event = { "BufReadPost", "BufNewFile" }, -- load when opening a file
		cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
    dependencies = {
      {
        "windwp/nvim-ts-autotag",
        event = { "BufReadPost", "BufNewFile" }, -- load when opening a file
        opts = {},
      },
    },
		keys = {
			{ "<c-space>", desc = "Increment Selection" },
			{ "<bs>", desc = "Decrement Selection", mode = "x" },
		},
		config = function()
			require("nvim-treesitter.configs").setup({
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = false, -- Matikan highlight regex default
				},
				indent = { enable = true },
				ensure_installed = { "javascript", "typescript", "html", "svelte", "tsx", "css" },
			})
		end,
	},
}
