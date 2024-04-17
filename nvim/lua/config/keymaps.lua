local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Select all file text
keymap.set("n", "<C-a>", "gg<S-v>G", opts)

-- Tabs
keymap.set("n", "te", ":tabedit ", opts)
keymap.set("n", "<tab>", ":tabnext<Return>", opts)
keymap.set("n", "<s-tab>", ":tabprev<Return>", opts)

-- Diagnostics
keymap.set("n", "<C-j>", function()
  vim.diagnostic.goto_next()
end)
keymap.set("n", "<C-k>", function()
  vim.diagnostic.goto_prev()
end)

-- Clipboard
vim.opt.clipboard = "unnamedplus"
