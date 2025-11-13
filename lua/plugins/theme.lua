return {
  'nvim-mini/mini.hues',
  version = '*',
  lazy = false,
  priority = 1000,
  config = function()
    -- local palette = {
    --   bg_edge2 = '#0b060e',
    --   bg_edge = '#1a141d',
    --   bg = '#262029',
    --   bg_mid = '#423b45',
    --   bg_mid2 = '#5e5762',
    --   fg_edge2 = '#f3f1e9',
    --   fg_edge = '#e5e3db',
    --   fg = '#d7d5cd',
    --   fg_mid = '#b7b5ad',
    --   fg_mid2 = '#97958e',
    --   accent = '#e4caf1',
    --   accent_bg = '#3a0f2f',
    --   red = '#f1c6e2',
    --   red_bg = '#3a0f2f',
    --   orange = '#fac6c1',
    --   orange_bg = '#410d0d',
    --   yellow = '#efcfab',
    --   yellow_bg = '#492c00',
    --   green = '#d3daad',
    --   green_bg = '#323700',
    --   cyan = '#b4e2c7',
    --   cyan_bg = '#003c24',
    --   azure = '#a7e1e8',
    --   azure_bg = '#004b51',
    --   blue = '#b8d9fc',
    --   blue_bg = '#00284a',
    --   purple = '#d7cef9',
    --   purple_bg = '#261844',
    -- }

    vim.g.colors_name = 'minihues-purple'
    local opts = {
      accent = 'azure',
      background = '#151025',
      foreground = '#c0c8cb',
    }
    require('mini.hues').setup(opts)

    -- require('mini.hues').apply_palette(palette)
    -- vim.g.colors_name = 'miniautumn'
    -- vim.cmd('colorscheme miniautumn')
  end,
}
