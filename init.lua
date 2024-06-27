vim.cmd([[colorscheme habamax]])

vim.g.netrw_browse_split    = 0
vim.g.netrw_banner          = 0
vim.g.netrw_winsize         = 25
vim.g.mapleader             = " "
vim.g.maplocalleader        = "\\"
vim.opt.nu 		            = true
vim.opt.relativenumber 	    = true
vim.opt.tabstop 	        = 4
vim.opt.softtabstop 	    = 4
vim.opt.shiftwidth 	        = 4
vim.opt.expandtab 	        = true
vim.opt.smartindent 	    = false -- this mofo fucks up perfectly aligned indentation if true
vim.opt.scrolloff           = 15
vim.opt.updatetime          = 25
vim.opt.undofile            = true
vim.opt.undodir             = os.getenv("HOME") .. "/.nvim/undodir"

-- block start: lazy nvim config and setup
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.loop.fs_stat(lazypath)) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    print(string.format("installing lazy.nvim: %s", lazypath))
    vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end
vim.opt.rtp:prepend(lazypath)
-- block end: lazy nvim config and setup

-- block start: plugin setups
require("lazy").setup({
    spec = {
        { "folke/which-key.nvim", lazy = true },
        {
            "nvim-telescope/telescope.nvim",
            dependencies = { "nvim-lua/plenary.nvim" }
        },
        {
            "nvim-treesitter/nvim-treesitter",
            run = function()
                local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
                ts_update()
            end
        },
        { "mbbill/undotree" },
        { "numToStr/Comment.nvim" }, 
        { "christoomey/vim-tmux-navigator" },
        { "eandrju/cellular-automaton.nvim" }, 
    },
})

require("which-key").setup()

require("telescope").setup {
    extensions = {
        media_files = {
            -- filetypes whitelist
            filetypes = { "o", "out", "dylib", "png", "jpeg", "pdf", "mp3", },
            -- find command (defaults to `fd`)
            find_cmd = "rg" -- `ripgrep`
        }
    },
}

local telescopebuiltin = require("telescope.builtin")

require("nvim-treesitter.configs").setup {
    ensure_installed = {
        "c", "asm", "lua", "rust"
    },
    sync_install = false,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
}

require("Comment").setup()
-- block end: plugin setups

vim.keymap.set("n", "<leader><leader>", vim.cmd.so)
vim.keymap.set("n", "<leader>pv", 	    vim.cmd.Ex)
vim.keymap.set("n", "<leader>cc",       ":!")
vim.keymap.set("n", "<leader>s",        [[:%s/]])
vim.keymap.set("n", "<leader>xa",       "<cmd>!chmod +x %<CR>", { silent = true })
vim.keymap.set("n", "<leader>xr",       "<cmd>!chmod -x %<CR>", { silent = true })
vim.keymap.set("n", "<leader>mr",       "<cmd>CellularAutomaton make_it_rain<CR>")
vim.keymap.set("n", "<leader>r",        "<C-r>");
vim.keymap.set("n", "<leader>ff",       telescopebuiltin.find_files, {})
vim.keymap.set("n", "<leader>fg",       telescopebuiltin.live_grep, {})
vim.keymap.set("n", "<leader>gg",       telescopebuiltin.git_files, {})
vim.keymap.set("n", "<leader>ps",       function()
    telescopebuiltin.grep_string({ search = vim.fn.input("Grep > ") })
end)
vim.keymap.set("n", "<leader>u",        vim.cmd.UndotreeToggle)
vim.keymap.set("n", "<C-k>",            vim.cmd.TmuxNavigateUp)
vim.keymap.set("n", "<C-j>",            vim.cmd.TmuxNavigateDown)
vim.keymap.set("n", "<C-h>",            vim.cmd.TmuxNavigateLeft)
vim.keymap.set("n", "<C-l>",            vim.cmd.TmuxNavigateRight)
