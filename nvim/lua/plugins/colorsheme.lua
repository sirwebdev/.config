return {
	{
		"scottmckendry/cyberdream.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			transparent = true,
			italic_comments = false,
			hide_fillchars = false,
			borderless_telescope = true,
			terminal_colors = false,
			cache = false,
		},
	},
	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "cyberdream",
		},
	},
}
