local map = vim.keymap.set

-- Diagnostic keymaps
map('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
map('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Exit from insert mode
map('i', 'jk', '<ESC>', { desc = 'Exic insert mode', silent = true })

-- Move Lines
map('n', '<A-j>', "<cmd>execute 'move .+' . v:count1<cr>==", { desc = 'Move Down' })
map('n', '<A-k>', "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = 'Move Up' })
map('i', '<A-j>', '<esc><cmd>m .+1<cr>==gi', { desc = 'Move Down' })
map('i', '<A-k>', '<esc><cmd>m .-2<cr>==gi', { desc = 'Move Up' })
map('v', '<A-j>', ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = 'Move Down' })
map('v', '<A-k>', ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = 'Move Up' })

-- buffers
map('n', '<S-h>', '<cmd>bprevious<cr>', { desc = 'Prev Buffer' })
map('n', '<S-l>', '<cmd>bnext<cr>', { desc = 'Next Buffer' })
map('n', '<leader>x', '<cmd>bdelete<cr>', { desc = 'Delete Buffer' })

-- term
map('t', '<esc>', '<C-\\><C-n>', { desc = 'Use jk to enter in terminal normal mode' })

-- Mini Files
map('n', '-', '<cmd>lua MiniFiles.open()<CR>', { desc = 'Open File Manager' })

-- Mini Pick
map('n', '<leader>ff', '<CMD>:Pick files<CR>', { desc = 'Open File Picker' })

-- Conform
map('n', '<leader>fm', "<cmd>lua require('conform').format()<CR>", { desc = 'Format using formatters' })

-- linter
map('n', '<leader>fl', "<cmd>lua require('lint').try_lint()<CR>", { desc = 'Lint current file' })
