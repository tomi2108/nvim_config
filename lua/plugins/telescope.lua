local git_hunks = function()
  require("telescope.pickers")
      .new({
        finder = require("telescope.finders").new_oneshot_job({ "git", "jump", "--stdout", "diff" }, {
          entry_maker = function(line)
            local filename, lnum_string = line:match("([^:]+):(%d+).*")
            if filename:match("^/dev/null") then
              return nil
            end
            return {
              value = filename,
              display = line,
              ordinal = line,
              filename = filename,
              lnum = tonumber(lnum_string),
            }
          end,
        }),
        sorter = require("telescope.sorters").get_generic_fuzzy_sorter(),
        previewer = require("telescope.config").values.grep_previewer({}),
        results_title = "Results",
        prompt_title = "Git hunks",
      }, {})
      :find()
end

return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.6",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "svermeulen/text-to-colorscheme.nvim",
    },
    config = function()
      local builtin = require("telescope.builtin")
      local theme = require("telescope.themes").get_ivy()
      vim.keymap.set("n", "<leader>q", builtin.find_files, {})
      vim.keymap.set("n", "<leader>cl", builtin.colorscheme, {})
      vim.keymap.set("n", "<leader>fg",
        function(opts)
          local mgrep = require("addons.multi_grep")
          mgrep(opts)
        end
        , {})
      vim.keymap.set("n", "<leader>gh", git_hunks, {})
      vim.keymap.set("n", "<leader>gs", builtin.git_status, {})
      vim.keymap.set("n", "gr", builtin.lsp_references, {})
      vim.keymap.set("n", "gi", builtin.lsp_implementations, {})
      vim.keymap.set("n", "<leader>fc", builtin.git_commits, {})
      vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
      vim.keymap.set("n", "<leader>fm", builtin.man_pages, {})
      vim.keymap.set("n", "<leader>km", builtin.keymaps, {})
      vim.keymap.set("n", "<leader>fhl", builtin.highlights, {})
      vim.keymap.set("n", "<leader>en", function()
        builtin.find_files({
          cwd = vim.fn.stdpath("config"),
        })
      end, {})
      vim.keymap.set("n", "gd", builtin.lsp_definitions, {})
      vim.keymap.set("n", "<leader>fws", function()
        local word = vim.fn.expand("<cword>")
        builtin.grep_string({ search = word })
      end)
      vim.keymap.set("n", "<leader>fWs", function()
        local word = vim.fn.expand("<cWORD>")
        builtin.grep_string({ search = word })
      end)
    end,
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      require("telescope").setup({
        pickers = {
          find_files = {
            hidden = true,
          },
        },
        defaults = {
          theme = "ivy",
          sorting_strategy = "ascending",
          layout_strategy = "bottom_pane",
          layout_config = {
            height = 20,
          },
          border = true,
          borderchars = {
            prompt = { " ", " ", "─", " ", " ", " ", "─", "─" },
            results = { "─", " ", " ", " ", "─", "─", " ", " " },
            preview = { "─", " ", "─", "│", "┬", "─", "─", "╰" },
          },
          file_ignore_patterns = {
            "node_modules",
            "package-lock",
            ".git/",
            "build/",
            "dist/",
            "bin/",
            ".png",
            ".jpg",
            ".gif",
            ".spl",
            ".add",
            ".ttf",
            ".otf",
            ".woff",
            ".sug",
          },
        },
        extensions = {
          fzf = {},
          ["ui-select"] = {
            require("telescope.themes").get_ivy({}),
          },
        },
      })
      require("telescope").load_extension("ui-select")
      require("telescope").load_extension("fzf")
    end,
  },
}
