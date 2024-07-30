return {
  "lewis6991/gitsigns.nvim",
  config = function()
    local gs = require("gitsigns")
    gs.setup({
      signs = {
        add = { text = "+" },
        change = { text = "~" },
        delete = { text = "-" },
        topdelete = { text = "-" },
      },
      signs_staged = {
        add = { text = "+" },
        change = { text = "~" },
        delete = { text = "-" },
        topdelete = { text = "-" },
      },
      on_attach = function(bufnr)
        local gitsigns = require("gitsigns")

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map("n", "]c", function()
          if vim.wo.diff then
            vim.cmd.normal({ "]c", bang = true })
          else
            gitsigns.nav_hunk("next")
          end
        end)

        map("n", "[c", function()
          if vim.wo.diff then
            vim.cmd.normal({ "[c", bang = true })
          else
            gitsigns.nav_hunk("prev")
          end
        end)
      end,
    })
    vim.keymap.set("n", "<C-b><C-p>", gs.preview_hunk, {})
    vim.keymap.set("n", "<C-b><C-r>", gs.reset_hunk, {})
    vim.keymap.set("n", "<C-b><C-s>", gs.stage_hunk, {})
    vim.keymap.set("n", "<C-b><C-u>", gs.undo_stage_hunk, {})
    vim.keymap.set("n", "<C-b><C-d>", gs.diffthis, {})
  end,
}

