return {
  "zenbones-theme/zenbones.nvim",
  -- Optionally install Lush. Allows for more configuration or extending the colorscheme
  -- If you don't want to install lush, make sure to set g:zenbones_compat = 1
  -- In Vim, compat mode is turned on as Lush only works in Neovim.
  dependencies = "rktjmp/lush.nvim",
  lazy = false,
  priority = 1000,
  setup = function()
    local setup = require("vim-colorscheme")
    -- setup.zenbones_setup()
    -- setup.lilac_garden_setup()
    setup.darkearth_setup()
    -- setup.react_setup()
  end,
}
