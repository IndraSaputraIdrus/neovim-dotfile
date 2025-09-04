vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.o.number = true
vim.o.showmode = false
vim.o.breakindent = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.signcolumn = 'yes'
vim.o.undofile = true

vim.o.cursorline = true
vim.o.scrolloff = 10
vim.o.confirm = true
vim.o.expandtab = true
vim.o.winborder = 'rounded'

vim.o.wrap = false
vim.o.tabstop = 4
vim.o.shiftround = true
vim.o.shiftwidth = 4

vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)

vim.opt.fillchars = {
  foldopen = "",
  foldclose = "",
  fold = " ",
  foldsep = " ",
  diff = "╱",
  eob = " ",
}

vim.diagnostic.config {
  virtual_text = true,
  underline = { severity = vim.diagnostic.severity.ERROR },
}
