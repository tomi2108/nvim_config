return {
  "goolord/alpha-nvim",
  dependencies = {
    -- "nvim-tree/nvim-web-devicons",
    "nvim-lua/plenary.nvim",
  },

  config = function()
    local alpha_nvim = require("alpha")
    local theta = require("alpha.themes.theta")
    local mru = theta.mru
    local cdir = vim.fn.getcwd()
    local plugin_list = require("lazy").plugins()
    local plugin_count = 0
    for _ in pairs(plugin_list) do
      plugin_count = plugin_count + 1
    end
    -- local header_val = {
    --   [[                 *       +]],
    --   [[           '                  |]],
    --   [[       ()    .-.,="``"=.    - o -]],
    --   [[             '=/_       \     |]],
    --   [[          *   |  '=._    |]],
    --   [[               \     `=./`,        ']],
    --   [[            .   '=.__.=' `='      *]],
    --   [[   +                         +]],
    --   [[        O      *        '       .]],
    -- }
    local section_mru = {
      type = "group",
      val = {
        { type = "padding", val = 2 },
        {
          type = "group",
          val = function() return { mru(0, cdir, 5) } end,
          opts = { shrink_margin = false },
        },
      },
    }
    theta.config.layout = {
      { type = "padding", val = 2 },
      { type = "padding", val = 2 },
      section_mru,
      { type = "padding", val = 1 },
    }
    theta.file_icons.enabled = false
    alpha_nvim.setup(theta.config)
  end,
}
