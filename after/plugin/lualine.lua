local lualine = require("lualine")

local lualine_nightfly = require("lualine.themes.nightfly")

local colors = {
    blue = "#BBCCFF",
    green = "#00BBA0",
    violet = "#BB61EF",
    yellow = "#AA997B",
    black = "#000000",
}

lualine_nightfly.normal.a.bg = colors.blue
lualine_nightfly.insert.a.bg = colors.green
lualine_nightfly.visual.a.bg = colors.violet
lualine_nightfly.command = {
    a = {
        gui = "bold",
        bg = colors.yellow,
        fg = colors.black,
    },
}

lualine.setup({
    options = {
        theme = lualine_nightfly
    }
})
