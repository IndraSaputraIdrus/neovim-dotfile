local o = vim.opt
local g = vim.g

g.mapleader = ' '
g.maplocalleader = '\\'

-- disable some default providers
g.loaded_node_provider = 0
g.loaded_python3_provider = 0
g.loaded_perl_provider = 0
g.loaded_ruby_provider = 0

-- Fix markdown indentation settings
g.markdown_recommended_style = 0

-- general
g.mapleader = ' '
o.mouse = 'a' -- enable mouse support
o.undofile = true -- enable persistent undo
o.clipboard = 'unnamedplus' -- connection to the system clipboard
o.backup = false -- disable backup
o.confirm = true -- Confirm to save changes before exiting modified buffer
o.iskeyword = '@,48-57,_,192-255,-' -- Treat dash as `word` textobject part
o.termguicolors = true
o.autoread = true

-- wrapping
o.wrap = true -- soft wrap lines
o.showbreak = '↪ '
o.breakindent = true -- make wrapped lines continue visually indented

-- ui
o.winborder = 'solid'
o.cursorline = true -- highlight the text line of the cursor
o.number = true -- show numberline
o.relativenumber = true -- show relative numberline
o.signcolumn = 'yes' -- always show the sign column
o.cmdheight = 1 -- height of the command bar, default: 1

-- special UI symbols
o.list = true -- show invisible characters.
-- o.listchars = 'extends:…,nbsp:␣,precedes:…,tab:> ,trail:·'
o.listchars = 'extends:…,nbsp:␣,precedes:…,tab:  ,trail:·'
o.fillchars = 'eob: ,fold:┄,foldclose:,foldopen:'

-- splitting
o.splitbelow = true -- splitting a new window below the current one
o.splitright = true -- splitting a new window at the right of the current one
o.splitkeep = 'screen'

-- scrolling
o.scrolloff = 15 -- minimum number of lines to keep above and below the cursor.

-- editing
o.updatetime = 200 -- length of time to wait before triggering the plugin
o.timeoutlen = 250 -- shorten key timeout length for which-key
o.inccommand = 'split' -- preview substitutions live

-- check spell
o.spell = true
o.spelllang = 'en_us,en_gb,cjk'

-- indenting
o.expandtab = true -- convert tabs to spaces
o.shiftwidth = 2 -- number of space inserted for indentation
o.softtabstop = 2 -- number of spaces that a <Tab> counts for.
o.tabstop = 2 -- number of space in a tab
o.smartindent = true -- do smart auto indenting.

-- searching
o.ignorecase = true -- ignore case during search
o.smartcase = true -- respect case if search pattern has upper case
o.hlsearch = true -- highlight search results as you type.

-- folding
o.foldmethod = 'marker'
o.foldmarker = '{{{,}}}' -- this is the default
o.foldlevel = 0 -- start with all folds closed
o.foldlevelstart = 0 -- open files with folds closed
