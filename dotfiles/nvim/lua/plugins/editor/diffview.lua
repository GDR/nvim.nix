-- Diffview — Git diff & history viewer
require("diffview").setup({})

local map = vim.keymap.set
map("n", "<leader>gd", "<cmd>DiffviewOpen<cr>", { desc = "Diffview Open" })
map("n", "<leader>gD", "<cmd>DiffviewFileHistory %<cr>", { desc = "Diffview File History" })
