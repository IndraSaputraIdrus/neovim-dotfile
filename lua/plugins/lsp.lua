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

        vim.lsp.enable({ "lua_ls", "ts_ls", "svelte" })
        -- vim.api.nvim_create_autocmd('LspAttach', {
        --     callback = function(ev)
        --         local client = vim.lsp.get_client_by_id(ev.data.client_id)
        --         if client:supports_method('textDocument/completion') then
        --             -- vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
        --         end
        --     end,
        -- })
    end,
}
