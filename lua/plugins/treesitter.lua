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
  "scss",
  "sql",
  "typescript",
  "tsx",
}
return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local tree_sitter = require("nvim-treesitter.configs")
    tree_sitter.setup({
      ensure_installed = ensure_installed,
      highlight = { enabled = true },
      indent = { enabled = true },
    })
  end,
}
