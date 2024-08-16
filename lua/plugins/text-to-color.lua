return {
	"svermeulen/text-to-colorscheme.nvim",
	config = function()
		require("text-to-colorscheme").setup({
			-- hsv_palettes = {
			-- 	{
			-- 		name = "Japanese tea garden",
			-- 		background_mode = "dark",
			-- 		background = { 156, 11, 14 }, -- #212523
			-- 		foreground = { 41, 12, 98 }, -- #fbf1dd
			-- 		accents = {
			-- 			{ 83, 37, 74 }, -- #a3be78
			-- 			{ 32, 60, 100 }, -- #ffb866
			-- 			{ 12, 20, 94 }, -- #efc8bf
			-- 			{ 182, 23, 72 }, -- #8db6b8
			-- 			{ 36, 38, 100 }, -- #fed79d
			-- 			{ 144, 16, 85 }, -- #b6d9c4
			-- 			{ 13, 18, 100 }, -- #ffdbd1
			-- 		},
			-- 	},
			-- 	{
			-- 		name = "dark stormy sea",
			-- 		background_mode = "dark",
			-- 		background = { 212, 52, 22 }, -- #1b2838
			-- 		foreground = { 216, 7, 87 }, -- #ced4dd
			-- 		accents = {
			-- 			{ 207, 57, 86 }, -- #5ea2da
			-- 			{ 205, 36, 100 }, -- #a3d9ff
			-- 			{ 198, 52, 94 }, -- #74cbf1
			-- 			{ 27, 60, 100 }, -- #ffab66
			-- 			{ 12, 65, 97 }, -- #f67656
			-- 			{ 173, 73, 55 }, -- #268c80
			-- 			{ 197, 54, 66 }, -- #4d8ea8
			-- 		},
			-- 	},
			-- 	{
			-- 		name = "winter sunrise",
			-- 		background_mode = "dark",
			-- 		background = { 221, 28, 16 }, -- #1d2129
			-- 		foreground = { 249, 3, 100 }, -- #f8f7ff
			-- 		accents = {
			-- 			{ 348, 32, 100 }, -- #ffadbe
			-- 			{ 33, 32, 100 }, -- #ffdaad
			-- 			{ 155, 32, 100 }, -- #adffdd
			-- 			{ 207, 32, 100 }, -- #addaff
			-- 			{ 275, 32, 100 }, -- #ddadff
			-- 			{ 317, 32, 100 }, -- #ffade8
			-- 			{ 99, 32, 100 }, -- #caffad
			-- 		},
			-- 	},
			-- },
			hex_palettes = {
				{
					name = "Lilac garden",
					background_mode = "dark",
					background = "#0B2A32",
					foreground = "#D6DDD0",
					accents = {
						"#258EA6",
						"#D0BFCD",
						"#549F93",
						"#8BB6A6",
						"#9FAF90",
						"#DEB1E2",
						"#E2C2FF",
					},
				},
			},
			default_palette = "Lilac garden",
		})
		vim.cmd("colorscheme text-to-colorscheme")
		local setup = require("vim-colorscheme")
		setup.lilac_garden_setup()
	end,
}
