require("ibl").setup({
})

require('catppuccin').setup({
    disable_background = true,
    integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
        notify = false,
        mini = false,
        mini = {
            enabled = true,
            indentscope_color = "#FFFFFF",
        },
    },
    custom_highlights = {
        Comment = {
            fg = "#999999"
        },
        String = {
            fg = "#7FAA66"
        },
        Boolean = {
            fg = "#C999BB"
        },
        Function = {
            fg = "#0099AA"
        },
    },
    -- hello
    indent_blankline = {
        enabled = true,
        scope_color = lavender, -- catppuccin color (eg. `lavender`) Default: text
        colored_indent_levels = false,
    },
})

function ColorMyPencils(color)
	color = color or "catppuccin"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

end

ColorMyPencils()
