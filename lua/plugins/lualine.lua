local sierra_colors= function()
  local palette = require("addons.sierra-palette")
  local theme = {
    normal = {
      a = {},
      b = {},
      c = {},
      x = {},
      y = {},
      z = {},
    },
    insert = {
      a = {},
      b = {},
      c = {},
      x = {},
      y = {},
      z = {},
    },
    visual = {
      a = {},
      b = {},
      c = {},
      x = {},
      y = {},
      z = {},
    },
    terminal = {
      a = {},
      b = {},
      c = {},
      x = {},
      y = {},
      z = {},
    },
  }
  local sections = { "a", "b", "c", "x", "y", "z" }

  for _, letter in pairs(sections) do
    theme.normal[letter].fg = palette.fg
    theme.insert[letter].fg = palette.fg
    theme.visual[letter].fg = palette.fg
    theme.terminal[letter].fg = palette.fg
    theme.normal[letter].bg = "none"
    theme.insert[letter].bg = "none"
    theme.visual[letter].bg = "none"
    theme.terminal[letter].bg = "none"
  end
  return theme
end

local everforest_colors = function()
  local theme = require("lualine.themes.everforest")
  local sections = { "a", "b", "c" }

  theme.normal.a.fg = theme.normal.a.bg
  theme.insert.a.fg = theme.insert.a.bg
  theme.visual.a.fg = theme.visual.a.bg
  theme.replace.a.fg = theme.replace.a.bg
  theme.command.a.fg = theme.command.a.bg
  theme.terminal.a.fg = theme.terminal.a.bg
  theme.inactive.a.fg = theme.inactive.a.bg

  for _, letter in pairs(sections) do
    theme.normal[letter].bg = "none"
    theme.insert[letter].bg = "none"
    theme.visual[letter].bg = "none"
    theme.replace[letter].bg = "none"
    theme.command[letter].bg = "none"
    theme.terminal[letter].bg = "none"
    theme.inactive[letter].bg = "none"
  end
  return theme
end

local lilac_garden_colors = function()
  local theme = require("lualine.themes.solarized_dark")
  local sections = { "a", "b", "c" }

  theme.normal.a.fg = theme.normal.a.bg
  theme.insert.a.fg = theme.insert.a.bg
  theme.visual.a.fg = theme.visual.a.bg
  theme.replace.a.fg = theme.replace.a.bg
  theme.inactive.a.fg = theme.inactive.a.bg
  theme.insert.a.bg = "none"
  theme.visual.a.bg = "none"
  theme.replace.a.bg = "none"

  for _, letter in pairs(sections) do
    theme.normal[letter].bg = "none"
    theme.inactive[letter].bg = "none"
  end
  return theme
end

local zenbones_colors = function()
  local palette = require("addons.zenwritten-palette")
  local theme = {
    normal = {
      a = {},
      b = {},
      c = {},
      x = {},
      y = {},
      z = {},
    },
    insert = {
      a = {},
      b = {},
      c = {},
      x = {},
      y = {},
      z = {},
    },
    visual = {
      a = {},
      b = {},
      c = {},
      x = {},
      y = {},
      z = {},
    },
    terminal = {
      a = {},
      b = {},
      c = {},
      x = {},
      y = {},
      z = {},
    },
  }
  local sections = { "a", "b", "c", "x", "y", "z" }

  for _, letter in pairs(sections) do
    theme.normal[letter].fg = palette.fg
    theme.insert[letter].fg = palette.fg
    theme.visual[letter].fg = palette.fg
    theme.terminal[letter].fg = palette.fg
    theme.normal[letter].bg = "none"
    theme.insert[letter].bg = "none"
    theme.visual[letter].bg = "none"
    theme.terminal[letter].bg = "none"
  end
  return theme
end
return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    { "archibate/lualine-time" },
  },
  config = function()
    local theme = lilac_garden_colors()
    -- local word_count = function()
    --   local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
    --   local content = table.concat(lines, " ")
    --   local words = 0
    --   end
    --   return "Words: " .. words
    -- end

    require("lualine").setup({
      options = {
        theme = theme,
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = {},
        lualine_x = {
          { "filetype", icon_only = true },
          { "filename", path = 1 }
        },
        lualine_z = { "ctime" },
      },
    })
  end,
}
