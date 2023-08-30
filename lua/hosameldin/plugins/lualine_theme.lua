local auto = require("lualine.themes.auto")

local theme_colors =
{
    normal        = '#58c3ff',
    normal_dark   = '#0e2029',
    insert        = '#bce77f',
    insert_dark   = '#232917',
    visual        = '#d84cff',
    visual_dark   = '#230c29',
    replace       = '#eb4d82',
    replace_dark  = '#290d18',
    command       = '#d1b983',
    command_dark  = '#29251b',
}

return {
  normal = {
    a = {bg = theme_colors.normal, fg = auto.normal.a.fg, gui = 'bold'},
    b = {bg = theme_colors.normal_dark, fg = theme_colors.normal},
    c = {bg = '', fg = auto.normal.c.fg}
  },
  insert = {
    a = {bg = theme_colors.insert, fg = auto.insert.a.fg, gui = 'bold'},
    b = {bg = theme_colors.insert_dark, fg = theme_colors.insert},
    c = {bg = '', fg = auto.normal.c.fg}
  },
  visual = {
    a = {bg = theme_colors.visual, fg = auto.visual.a.fg, gui = 'bold'},
    b = {bg = theme_colors.visual_dark, fg = theme_colors.visual},
    c = {bg = '', fg = auto.normal.c.fg}
  },
  replace = {
    a = {bg = theme_colors.replace, fg = auto.replace.a.fg, gui = 'bold'},
    b = {bg = theme_colors.replace_dark, fg = theme_colors.replace},
    c = {bg = '', fg = auto.normal.c.fg}
  },
  command = {
    a = {bg = theme_colors.command, fg = auto.command.a.fg, gui = 'bold'},
    b = {bg = theme_colors.command_dark, fg = theme_colors.command},
    c = {bg = '', fg = auto.normal.c.fg}
  },
  inactive = {
    a = {bg = auto.inactive.a.bg, fg = auto.inactive.a.fg, gui = 'bold'},
    b = {bg = auto.inactive.b.bg, fg = auto.inactive.b.fg},
    c = {bg = '', fg = auto.inactive.c.fg}
  }
}
