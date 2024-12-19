return {
  "folke/trouble.nvim",
  config = function()
    local trouble = require("trouble")
    trouble.setup({
      auto_open       = false,
      auto_preview    = false,
      icons           = {
        folder_closed = "",
        folder_open = "",
      },
      win             = {
        size = 5,
        wo = { wrap = true }
      },
      multiline       = true,
      warn_no_results = false,
      open_no_results = true,
      auto_refresh    = true,
      auto_jump       = false,
      focus           = true,
      indent_guides   = false,
      debug           = false,
      auto_close      = true,
      restore         = true,
      mode            = "diagnostics"
    })
    vim.keymap.set("n", "<leader>dd", function() vim.cmd("Trouble diagnostics toggle") end)
  end,
}
