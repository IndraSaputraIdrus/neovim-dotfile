return {
    "mfussenegger/nvim-lint",
    config = function()
        local linter = require("lint")

        linter.linters_by_ft = {
            typescript = { "oxlint" },
            javascript = { "oxlint" },
            json = { "biomejs" },
            svelte = { "eslint_d" },
            -- lua = { "luacheck" },
        }

        -- vim.api.nvim_create_autocmd({ 'BufWritePost', 'InsertLeave' }, {
        --     group = vim.api.nvim_create_augroup('indra.config', { clear = true }),
        --     callback = function()
        --         if vim.bo.modifiable then
        --             linter.try_lint()
        --         end
        --     end,
        -- })

        -- vim.lsp.enable({ "eslint" })
    end,
}
