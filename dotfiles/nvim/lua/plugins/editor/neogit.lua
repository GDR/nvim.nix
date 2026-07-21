-- Neogit — Magit clone for Neovim
require("neogit").setup({
  integrations = {
    diffview = true,
    telescope = true,
  },
})

vim.keymap.set("n", "<leader>gs", "<cmd>Neogit<cr>", { desc = "Neogit Status" })
