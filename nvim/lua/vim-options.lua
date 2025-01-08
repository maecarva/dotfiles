-- base config
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set relativenumber")
vim.cmd("set number")
vim.cmd("set autoindent")
vim.g.mapleader= " "
vim.g.maplocalleader = "\\"

-- cmdline
vim.api.nvim_set_keymap('n', ':', '<cmd>FineCmdline<CR>', {noremap = true})
