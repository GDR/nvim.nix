-- refactoring.nvim — Code refactoring tool
require("refactoring").setup({})

local map = vim.keymap.set
map({ "n", "x" }, "<leader>r", function()
  require("refactoring").select_refactor()
end, { desc = "Refactor Options" })
