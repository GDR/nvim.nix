-- grug-far.nvim — Search and replace tool
require("grug-far").setup({})

vim.keymap.set({ "n", "v" }, "<leader>sr", function()
  local grug = require("grug-far")
  local ext = vim.bo.buftype == "" and vim.fn.expand("%:e") or nil
  grug.open({ prefills = { filesFilter = ext and ext ~= "" and ("*." .. ext) or nil } })
end, { desc = "Search and Replace (Grug-far)" })
