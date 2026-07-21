-- smart-splits.nvim — Multiplexer-aware split navigation and resizing
local ss = require("smart-splits")
ss.setup({})

local map = vim.keymap.set
map("n", "<C-h>", ss.move_cursor_left, { desc = "Move to Left Split/Pane" })
map("n", "<C-j>", ss.move_cursor_down, { desc = "Move to Lower Split/Pane" })
map("n", "<C-k>", ss.move_cursor_up, { desc = "Move to Upper Split/Pane" })
map("n", "<C-l>", ss.move_cursor_right, { desc = "Move to Right Split/Pane" })

map("n", "<C-Left>", ss.resize_left, { desc = "Resize Split Left" })
map("n", "<C-Down>", ss.resize_down, { desc = "Resize Split Down" })
map("n", "<C-Up>", ss.resize_up, { desc = "Resize Split Up" })
map("n", "<C-Right>", ss.resize_right, { desc = "Resize Split Right" })
