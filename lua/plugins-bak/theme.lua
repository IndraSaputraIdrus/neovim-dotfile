return {
  'nvim-mini/mini.hues',
  version = '*',
  lazy = false,
  priority = 1000,
  config = function()
    vim.g.colors_name = 'minihues-purple'
    local opts = {
      accent = 'azure',
      background = '#151025',
      foreground = '#c0c8cb',
    }
    require('mini.hues').setup(opts)
  end,
}
