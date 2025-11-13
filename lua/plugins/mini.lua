return {
  {
    'nvim-mini/mini.nvim',
    version = '*',
    event = 'VeryLazy',
    config = function()
      require('mini.files').setup()
      require('mini.ai').setup()
      require('mini.pick').setup()
      require('mini.extra').setup()
      require('mini.icons').setup()
      require('mini.statusline').setup()
      require('mini.tabline').setup()
    end,
  },
}
