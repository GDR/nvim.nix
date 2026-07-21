-- outline.nvim — Tree view of symbols
require("outline").setup({})

vim.keymap.set("n", "<leader>o", "<cmd>Outline<cr>", { desc = "Toggle Code Outline" })
