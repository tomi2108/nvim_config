local ensure_installed = {
  "astro",
  "bash",
  "c",
  "c_sharp",
  "cmake",
  "cpp",
  "css",
  "csv",
  "dockerfile",
  "git_config",
  "gitcommit",
  "gitignore",
  "gitignore",
  "go",
  "graphql",
  "haskell",
  "hlsl",
  "html",
  "http",
  "java",
  "javascript",
  "jsdoc",
  "json",
  "lua",
  "make",
  "markdown",
  "markdown_inline",
  "nu",
  "prolog",
  "regex",
  "scss",
  "sql",
  "tmux",
  "tsx",
  "typescript",
  "vim",
  "vimdoc",
  "yaml",
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
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    dependencies = "nvim-treesitter",
    lazy = false,
    config = function()
      require("nvim-treesitter.configs").setup({
        textobjects = {
          select = {
            enable = true,
            lookahead = true,
            keymaps = {
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",
            }
          }
        }
      })
    end
  },
  {
    -- "nvim-treesitter/nvim-treesitter-context",
    -- config = function()
    --   require("treesitter-context").setup({
    --     max_lines = 3,
    --   })
    -- end,
  },
}
