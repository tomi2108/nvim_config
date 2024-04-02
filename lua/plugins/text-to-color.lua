return {
  "svermeulen/text-to-colorscheme.nvim",
  config = function()
    require("text-to-colorscheme").setup({
      hsv_palettes = {
        {
          name = "Japanese tea garden",
          background_mode = "dark",
          background = { 156, 11, 14 }, -- #212523
          foreground = { 41, 12, 98 },  -- #fbf1dd
          accents = {
            { 83,  37, 74 },            -- #a3be78
            { 32,  60, 100 },           -- #ffb866
            { 12,  20, 94 },            -- #efc8bf
            { 182, 23, 72 },            -- #8db6b8
            { 36,  38, 100 },           -- #fed79d
            { 144, 16, 85 },            -- #b6d9c4
            { 13,  18, 100 },           -- #ffdbd1
          }
        },
      },
      default_palette = "Japanese tea garden",
    })
  end
}
