return {
  {
    -- "hrsh7th/nvim-cmp",
    -- config = function()
    -- 	local cmp = require("cmp")
    -- 	local lspkind = require("lspkind")
    -- 	require("luasnip.loaders.from_vscode").lazy_load()
    -- 	local as = require("addons.snippets")
    -- 	as.load_snippets()
    -- 	cmp.setup({
    -- 		snippet = {
    -- 			expand = function(args)
    -- 				require("luasnip").lsp_expand(args.body)
    -- 			end,
    -- 		},
    -- 		mapping = cmp.mapping.preset.insert({
    -- 			["<C-f>"] = cmp.mapping.scroll_docs(-4),
    -- 			["<C-b>"] = cmp.mapping.scroll_docs(4),
    -- 			["<C-n>"] = cmp.mapping.select_next_item(),
    -- 			["<C-p>"] = cmp.mapping.select_prev_item(),
    -- 			["<C-Space>"] = cmp.mapping.complete(),
    -- 			["<C-e>"] = cmp.mapping.abort(),
    -- 			["<C-w>"] = cmp.mapping.confirm({ select = true }),
    -- 			["<CR>"] = cmp.mapping.confirm({ select = true }),
    -- 		}),
    -- 		sources = cmp.config.sources({
    -- 			{ name = "nvim_lsp" },
    -- 			{ name = "luasnip" }, -- For luasnip users.
    -- 			{ name = "buffer" },
    -- 			{ name = "path" },
    -- 			-- { name = "cmdline" },
    -- 			{ name = "cmp_nvim_lsp_signature_help" },
    -- 			{ name = "cmp_nvim_lsp_document_symbol" },
    -- 			{ name = "friendly-snippets" },
    -- 			{ name = "dotenv" },
    -- 			{ name = "cmp-npm" },
    -- 		}),
    -- 		formatting = {
    -- 			format = lspkind.cmp_format({
    -- 				mode = "text_symbol",
    -- 				maxwidth = 50,
    -- 				ellipsis_char = "...",
    -- 				show_labelDetails = true,
    -- 			}),
    -- 		},
    -- 	})
    -- cmp.setup.cmdline("/", {
    -- 	mapping = cmp.mapping.preset.cmdline(),
    -- 	sources = {
    -- 		{ name = "nvim_lsp_document_symbol" },
    -- 		{ name = "buffer" },
    -- 	},
    -- })
    -- cmp.setup.cmdline(":", {
    -- 	mapping = cmp.mapping.preset.cmdline(),
    -- 	sources = cmp.config.sources({
    -- 		{ name = "path" },
    -- 		{
    -- 			name = "cmdline",
    -- 			option = {
    -- 				ignore_cmds = { "Man", "!" },
    -- 			},
    -- 		},
    -- 	}),
    -- })
    -- end,
  },
  {
    'saghen/blink.cmp',
    lazy = false,
    dependencies = {
      { 'rafamadriz/friendly-snippets' },
      { 'L3MON4D3/LuaSnip',            version = 'v2.*' },
    },
    version = 'v0.*',
    opts = {
      keymap = {
        preset = 'default',
        ['<C-w>'] = { 'select_and_accept' },
        ['<C-j>'] = { 'snippet_forward' },
        ['<C-k>'] = { 'snippet_backward' },
      },
      snippet = {
        active = function(filter)
          if filter and filter.direction then
            return require('luasnip').jumpable(filter.direction)
          end
          return require('luasnip').in_snippet()
        end,
        expand = function(snippet)
          require("luasnip").lsp_expand(snippet)
        end,
        jump = function(direction)
          local ls = require("luasnip")
          if (direction < 0) then
            if ls.expand_or_jumpable(direction) then
              ls.expand_or_jump(direction)
            end
          else
            if ls.jumpable(direction) then
              ls.jump(direction)
            end
          end
        end,

      },
      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = 'mono'
      },
      completion = {
        accept = {
          auto_brackets = {
            enabled = true
          },
        },
        documentation = {
          window                  = {
            border = "none"
          },
          auto_show               = true,
          treesitter_highlighting = true,
          auto_show_delay_ms      = 0
        }
      },
      sources = {
        default = { 'lsp', 'path', 'luasnip', 'buffer', },
        cmdline = {},
      },
      signature = { enabled = true },
    },
    opts_extend = { "sources.default" }
  },
  {
    "chrisgrieser/nvim-scissors",
    dependencies = "nvim-telescope/telescope.nvim",
    keys = {
      { "<leader>ne", function() require("scissors").editSnippet() end, desc = "󰩫 Edit" },
      {
        "<leader>na",
        function() require("scissors").addNewSnippet() end,
        mode = { "n", "x" },
        desc = "󰩫 Add",
      },
    },
    opts = {
      editSnippetPopup = {
        height = 0.5,
        width = 0.7,
        border = "none",
        keymaps = {
          deleteSnippet = "<D-BS>",
          insertNextPlaceholder = "<leader>t",
        },
      },
      telescope = { alsoSearchSnippetBody = true },
    },
  },
  {
    -- "David-Kunz/cmp-npm",
    -- dependencies = { "nvim-lua/plenary.nvim" },
    -- ft = "json",
    -- config = function()
    --   require("cmp-npm").setup({})
    -- end,
  },
  -- { "hrsh7th/cmp-nvim-lsp" },
  -- { "hrsh7th/cmp-cmdline" },
  -- { "hrsh7th/cmp-path" },
  -- { "hrsh7th/cmp-nvim-lsp-document-symbol" },
  -- { "hrsh7th/cmp-nvim-lsp-signature-help" },
  -- { "hrsh7th/cmp-buffer" },
  { "rafamadriz/friendly-snippets" },
  -- { "SergioRibera/cmp-dotenv" },
  {
    "L3MON4D3/LuaSnip",
    version = 'v2.*',
    dependencies = {
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",
    },
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
      require("addons.snippets").load_snippets()
    end
  },
}
