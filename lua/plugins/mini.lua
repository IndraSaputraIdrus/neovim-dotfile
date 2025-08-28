return {
    {
        "nvim-mini/mini.icons",
        lazy = false,
        config = function()
            local mini_icons = require("mini.icons")
            mini_icons.setup()
            mini_icons.tweak_lsp_kind()
        end,
    },
    {
        "nvim-mini/mini.pick",
        version = "*",
        opts = {},
    },
    {
        'nvim-mini/mini.tabline',
        version = '*',
        opts = {}
    },
    {
        'nvim-mini/mini.files',
        version = '*',
        opts = {}
    },
    {
        'nvim-mini/mini.ai',
        version = '*',
        event = "VeryLazy",
        opts = {}
    },
    {
        'nvim-mini/mini.statusline',
        version = '*',
        opts = {}
    },
}
