return { 
  'olivercederborg/poimandres.nvim',
  lazy = false,
  priority = 1000,
  opts = {},
  init = function()
    vim.cmd('colorscheme poimandres')
  end
}
