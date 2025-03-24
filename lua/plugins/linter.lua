return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile" }, -- Lazy load
	config = function()
		local linter = require("lint")

		linter.linters_by_ft = {
			javascript = { "eslint_d", "biomejs" },
			typescript = { "eslint_d", "biomejs" },
			javascriptreact = { "eslint_d", "biomejs" },
			typescriptreact = { "eslint_d", "biomejs" },
			svelte = { "eslint_d" },
		}

		local linter_autogroup = vim.api.nvim_create_augroup("lint", { clear = true })

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = linter_autogroup,
			callback = function()
				linter.try_lint()
			end,
		})

		vim.keymap.set("n", "<leader>l", function()
			linter.try_lint()
		end, { desc = "Trigger linting for current file" })
	end,
}
