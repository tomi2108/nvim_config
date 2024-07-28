vim.api.nvim_create_autocmd("Colorscheme", {
  callback = function()
    local groups = {
      "CursorLine",
      "Normal",
      "NormalNC",
      "NormalFloat",
      "Float",
      "FloatTitle",
      "FloatBorder",
      "SignColumn",
      -- "GitSignsAdd",
      -- "GitSignsChange",
      -- "GitSignsDelete",
      "Pmenu",
      "WinSeparator",
      "TelescopeNormal",
      "TelescopeBorder",
      "TelescopeSelection",
      "TelescopePreviewNormal",
      "WhichKeyFloat",
    }

    for _, group in ipairs(groups) do
      vim.cmd("hi " .. group .. " ctermbg=None guibg=NONE")
    end
    return true
  end,
  desc = "transparent backgrounds",
})
