local map = vim.keymap.set

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
map('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
map('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit from insert mode
map("i", "jk", "<ESC>", { desc = "Exic insert mode", silent = true })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
map('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
map('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
map('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
map('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Move Lines
map("n", "<A-j>", "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "Move Down" })
map("n", "<A-k>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = "Move Up" })
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
map("v", "<A-j>", ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = "Move Down" })
map("v", "<A-k>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = "Move Up" })

-- buffers
map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next Buffer" })
map("n", "<leader>x", "<cmd>bdelete<cr>", { desc = "Delete Buffer" })

-- term
map('t', '<esc>', '<C-\\><C-n>', { desc = 'Use jk to enter in terminal normal mode' })

-- Picker
map("n", "<leader>ff", "<CMD>:Pick files<CR>", { desc = "Open file picker" })

-- LSP
map("n", "<leader>fm", vim.lsp.buf.format, { desc = "Open file picker" })

-- MiniFiles
map('n', '-', '<CMD>lua MiniFiles.open()<CR>', { desc = 'Open File Manager' })


-- MiniCompletion
_G.cr_action = function()
    -- If there is selected item in popup, accept it with <C-y>
    if vim.fn.complete_info()['selected'] ~= -1 then return '\25' end
    -- Fall back to plain `<CR>`. You might want to customize according
    -- to other plugins. For example if 'mini.pairs' is set up, replace
    -- next line with `return MiniPairs.cr()`
    return '\r'
end
map('i', '<CR>', 'v:lua.cr_action()', { expr = true })

