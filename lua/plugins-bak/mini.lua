return {
  {
    'nvim-mini/mini.nvim',
    version = '*',
    event = 'VeryLazy',
    config = function()
      require('mini.files').setup()
      vim.keymap.set('n', '-', '<cmd>lua MiniFiles.open()<cr>', { desc = 'Open file tree' })

      require('mini.pick').setup()
      vim.keymap.set('n', '<leader>ff', '<cmd>:Pick files<cr>', { desc = 'Open file picker' })
      vim.keymap.set(
        'n',
        'grr',
        '<cmd>lua MiniExtra.pickers.lsp({ scope = "references" })<cr>',
        { desc = 'LSP buf refenrences' }
      )
      vim.keymap.set('n', 'grD', '<cmd>lua MiniExtra.pickers.diagnostic()<cr>', { desc = 'LSP buf diagnostic' })
      vim.keymap.set(
        'n',
        'grq',
        '<cmd>lua MiniExtra.pickers.list({ scope = "quickfix" })<cr>',
        { desc = 'LSP buf quickfix' }
      )

      require('mini.icons').setup()
      --- @diagnostic disable-next-line: undefined-global
      MiniIcons.mock_nvim_web_devicons()

      local mini_indent = require('mini.indentscope')
      mini_indent.setup({
        symbol = '▏',
        draw = {
          animation = mini_indent.gen_animation.none(),
          priority = 100,
          delay = 20,
        },
      })
      vim.api.nvim_set_hl(0, 'MiniIndentscopeSymbol', { fg = '#5b6268' })

      require('mini.statusline').setup()
      require('mini.tabline').setup()
      require('mini.ai').setup()
      require('mini.extra').setup()
      require('mini.surround').setup()
    end,
  },
}
