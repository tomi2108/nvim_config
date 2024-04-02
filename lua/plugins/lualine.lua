return {
  "nvim-lualine/lualine.nvim",
  config = function()
    local theme = require("lualine.themes.onenord")
    local sections = { "a", "b" }

    for _, letter in pairs(sections) do
      theme.normal[letter].bg = "#2e3440"
      theme.insert[letter].bg = "#2e3440"
      theme.visual[letter].bg = "#2e3440"
      theme.replace[letter].bg = "#2e3440"
      theme.command[letter].bg = "#2e3440"
    end

    theme.normal.a.fg = theme.normal.b.fg
    theme.insert.a.fg = theme.insert.b.fg
    theme.visual.a.fg = theme.visual.b.fg
    theme.replace.a.fg = theme.replace.b.fg
    theme.command.a.fg = theme.command.b.fg

    theme.normal.c.bg = "#2e3440"

    require("lualine").setup({
      options = {
        theme = theme,
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = { { "filename", path = 1 } },
        lualine_x = { "encoding", "fileformat", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
    })
  end,
}
