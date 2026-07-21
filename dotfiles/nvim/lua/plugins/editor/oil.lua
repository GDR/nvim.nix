-- Oil.nvim — File explorer buffer
require("oil").setup({
  default_file_explorer = false, -- Keep neo-tree as primary sidebar
  view_options = {
    show_hidden = true,
  },
})

vim.keymap.set("n", "-", "<cmd>Oil<cr>", { desc = "Open Parent Directory (Oil)" })
