-- avante.nvim — AI powered coding assistant
require("avante").setup({
  provider = "claude",
  mappings = {
    ask = "<leader>aa",
    edit = "<leader>ae",
    refresh = "<leader>ar",
  },
})

local map = vim.keymap.set
map({ "n", "v" }, "<leader>aa", "<cmd>AvanteAsk<cr>", { desc = "Avante Ask" })
map({ "n", "v" }, "<leader>ae", "<cmd>AvanteEdit<cr>", { desc = "Avante Edit" })
