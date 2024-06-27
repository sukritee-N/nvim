vim.cmd("colorscheme habamax")

vim.g.netrw_browse_split    = 0
vim.g.netrw_banner          = 0
vim.g.netrw_winsize         = 25
vim.g.mapleader             = " "

vim.keymap.set("n", "<leader><leader>", vim.cmd.so)
vim.keymap.set("n", "<leader>pv", 	    vim.cmd.Ex)

vim.opt.nu 		        = true
vim.opt.relativenumber 	= true
vim.opt.tabstop 	    = 4
vim.opt.softtabstop 	= 4
vim.opt.shiftwidth 	    = 4
vim.opt.expandtab 	    = true
vim.opt.smartindent 	= false -- this mofo fucks up perfectly aligned indentation if true
