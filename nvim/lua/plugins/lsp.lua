return {
	"neovim/nvim-lspconfig",
	event = "LazyFile",
	dependencies = {
		{ "folke/neoconf.nvim", cmd = "Neoconf", config = false, dependencies = { "nvim-lspconfig" } },
		{ "folke/neodev.nvim", opts = {} },
		"mason.nvim",
		"williamboman/mason-lspconfig.nvim",
	},
	setup = {
		prismals = function(_, opts)
			require("prismals").setup({ server = opts })
			return true
		end,
	},
}
