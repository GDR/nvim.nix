-- nvim-treesitter-context — Sticky function headers
require("treesitter-context").setup({
  enable = true,
  max_lines = 3,
  trim_scope = "outer",
})

local map = vim.keymap.set
map("n", "[c", function()
  require("treesitter-context").go_to_context()
end, { desc = "Go to Context" })
map("n", "<leader>ut", "<cmd>TSContextToggle<cr>", { desc = "Toggle Treesitter Context" })
