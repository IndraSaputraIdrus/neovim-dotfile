-- set <space> as the leader key
-- see `:help mapleader`
--  note: must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- set to true if you have a nerd font installed and selected in the terminal
vim.g.have_nerd_font = true

-- [[ setting options ]]
-- see `:help vim.o`
-- note: you can change these options as you wish!
--  for more options, you can see `:help option-list`

-- make line numbers default
vim.o.number = true
-- you can also add relative line numbers, to help with jumping.
--  experiment for yourself to see if you like it!
-- vim.o.relativenumber = true

-- enable mouse mode, can be useful for resizing splits for example!
vim.o.mouse = 'a'

-- don't show the mode, since it's already in the status line
vim.o.showmode = false

-- sync clipboard between os and neovim.
--  schedule the setting after `uienter` because it can increase startup-time.
--  remove this option if you want your os clipboard to remain independent.
--  see `:help 'clipboard'`
vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)

-- enable break indent
vim.o.breakindent = true

-- enable break indent
vim.o.breakindent = true

-- save undo history
vim.o.undofile = true

-- case-insensitive searching unless \c or one or more capital letters in the search term
vim.o.ignorecase = true
vim.o.smartcase = true

-- keep signcolumn on by default
vim.o.signcolumn = 'yes'

-- decrease update time
vim.o.updatetime = 250

-- decrease mapped sequence wait time
vim.o.timeoutlen = 500

-- configure how new splits should be opened
vim.o.splitright = true
vim.o.splitbelow = true

-- sets how neovim will display certain whitespace characters in the editor.
--  see `:help 'list'`
--  and `:help 'listchars'`
--
--  notice listchars is set using `vim.opt` instead of `vim.o`.
--  it is very similar to `vim.o` but offers an interface for conveniently interacting with tables.
--   see `:help lua-options`
--   and `:help lua-options-guide`
-- vim.o.list = true
-- vim.opt.listchars = {
--   tab = '│',
--   trail = '·',
--   nbsp = '␣',
-- }
--

-- for indent line (source lazyvim)
vim.opt.fillchars = {
  foldopen = '',
  foldclose = '',
  fold = ' ',
  foldsep = ' ',
  diff = '╱',
  eob = ' ',
}

-- preview substitutions live, as you type!
vim.o.inccommand = 'split'

-- show which line your cursor is on
vim.o.cursorline = true

-- minimal number of screen lines to keep above and below the cursor.
vim.o.scrolloff = 10

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
-- see `:help 'confirm'`
vim.o.confirm = true

-- optionally enable 24-bit colour
vim.o.termguicolors = true

vim.o.expandtab = true -- use spaces instead of tabs

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwplugin = 1

vim.o.wrap = false
vim.o.tabstop = 4 -- number of spaces tabs count for
vim.o.shiftround = true -- round indent
vim.o.shiftwidth = 4 -- size of an indent

vim.o.winborder = 'rounded'

-- disable select first in autocomplete
vim.cmd 'set completeopt+=noselect'

-- Diagnostics
vim.diagnostic.config {
  virtual_text = true,
  underline = { severity = vim.diagnostic.severity.ERROR },
}

-- kickstart end
