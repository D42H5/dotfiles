-- Space as leader
vim.g.mapleader = ' '

-- Keymaps
local nopts = {
	noremap = true,
}

-- Go next (b) / previous (B) buffer
vim.keymap.set('n', 'gb', '<cmd>bn<cr>', nopts)
vim.keymap.set('n' ,'gB', '<cmd>bp<cr>', nopts)

--- delete commented line(s)... probably better ways of doing this
vim.keymap.set({'n', 'v'}, '<C-/>', '<cmd>norm ^xxx<cr>', nopts)

--- comment selected line(s)
vim.keymap.set({'n', 'v'}, '<C-.>', '<cmd>norm I// <cr>', nopts)

-- Vim-Tmux-Navigator rebinds
vim.keymap.set('n', '<M-a>', '<cmd>TmuxNavigateLeft<cr>')
vim.keymap.set('n', '<M-f>', '<cmd>TmuxNavigateRight<cr>')
vim.keymap.set('n', '<M-s>', '<cmd>TmuxNavigateDown<cr>')
vim.keymap.set('n', '<M-d>', '<cmd>TmuxNavigateUp<cr>')
vim.keymap.set('n', '<M-/>', '<cmd>TmuxNavigatePrevious<cr>')
