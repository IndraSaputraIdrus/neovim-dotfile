return {
    'saghen/blink.cmp',
    version = "1.*",
    opts = {
        keymap = {
            preset = "enter",
        },
        completion = {
            menu = {
                draw = {
                    columns = {
                        { "label",     "label_description", gap = 1 },
                        { "kind_icon", "kind",              gap = 1 }
                    },
                    components = {
                        kind_icon = {
                            text = function(ctx)
                                local kind_icon, _, _ = require("mini.icons").get("lsp", ctx.kind)
                                return kind_icon
                            end,
                            highlight = function(ctx)
                                local _, hl, _ = require("mini.icons").get("lsp", ctx.kind)
                                return hl
                            end,
                        },
                        kind = {
                            hightlight = function(ctx)
                                local _, hl, _ = require("mini.icons").get("lsp", ctx.kind)
                                return hl
                            end,
                        }
                    }
                },
            },
        },
    },
}
