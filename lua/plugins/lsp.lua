return {
    "neovim/nvim-lspconfig",
    dependencies = {
        { 'j-hui/fidget.nvim',           opts = {} },
        { "mason-org/mason.nvim",        opts = {} },
    },
    config = function()
        vim.lsp.config("lua_ls", {
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { "vim" }
                    }
                }
            }
        })

        vim.lsp.enable({ "lua_ls", "ts_ls", "svelte", "biome" })
    end,
}
