return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    prioriry = 1000,
    opts = {
      style = "storm",
      transparent = true,
      terminal_colors = true,
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight",
    },
  },
}
