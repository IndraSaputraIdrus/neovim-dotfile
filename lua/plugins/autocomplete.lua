-- Auto completion
MiniDeps.later(function()
  MiniDeps.add {
    source = 'Saghen/blink.cmp',
    checkout = 'v1.6.0',
  }

  require('blink.cmp').setup {
    keymap = {
      preset = 'enter',
    },
  }
end)
