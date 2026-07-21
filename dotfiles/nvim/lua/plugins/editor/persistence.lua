-- Persistence.nvim — automated clean session management
require("persistence").setup({
  dir = vim.fn.stdpath("state") .. "/sessions/",
  need = 1,
  branch = true, -- use git branch in session name
})

local map = vim.keymap.set
map("n", "<leader>qs", function() require("persistence").load() end, { desc = "Restore Session (Dir)" })
map("n", "<leader>qS", function() require("persistence").select() end, { desc = "Select Session" })
map("n", "<leader>ql", function() require("persistence").load({ last = true }) end, { desc = "Restore Last Session" })
map("n", "<leader>qd", function() require("persistence").stop() end, { desc = "Don't Save Current Session" })
