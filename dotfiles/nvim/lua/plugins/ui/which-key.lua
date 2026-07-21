-- Keybinding popup hints
require("which-key").setup({
  plugins = { spelling = true },
})

-- Register group labels
require("which-key").add({
  { "<leader>a", group = "ai / avante" },
  { "<leader>b", group = "buffers" },
  { "<leader>c", group = "code" },
  { "<leader>f", group = "file/find" },
  { "<leader>g", group = "git" },
  { "<leader>gh", group = "git hunks" },
  { "<leader>r", group = "refactor" },
  { "<leader>s", group = "search" },
  { "<leader>u", group = "ui" },
  { "<leader>x", group = "diagnostics" },
})
