return {
  'saghen/blink.cmp',
  dependencies = { 'rafamadriz/friendly-snippets' },
  event = 'VimEnter',
  version = '1.*',
  opts = {
    keymap = { preset = 'enter' },
    appearance = {
      nerd_font_variant = 'mono',
    },
    completion = { documentation = { auto_show = false, auto_show_delay_ms = 50 } },
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
    },
    fuzzy = { implementation = 'lua' },
    signature = { enabled = false },
  },
  opts_extend = { 'sources.default' },
}
