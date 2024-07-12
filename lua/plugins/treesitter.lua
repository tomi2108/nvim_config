local ensure_installed = {
  "astro",
  "cmake",
  "cpp",
  "css",
  "gitignore",
  "go",
  "graphql",
  "http",
  "java",
  "go",
  "haskell",
  "scss",
  "sql",
  "typescript",
  "tsx",
  "vim",
  "regex",
  "lua",
  "bash",
  "markdown",
  "markdown_inline",
  "vimdoc",
}
return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local tree_sitter = require("nvim-treesitter.configs")
      tree_sitter.setup({
        ensure_installed = ensure_installed,
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },
  -- {
  --   "nvim-treesitter/nvim-treesitter-context",
  --   config = function()
  --     require("treesitter-context").setup({
  --       max_lines = 3,
  --     })
  --     vim.keymap.set("n", "[c", function()
  --       require("treesitter-context").go_to_context(vim.v.count1)
  --       vim.api.nvim_feedkeys("zz", "n", true)
  --     end, { silent = true })
  --   end,
  -- },
}
