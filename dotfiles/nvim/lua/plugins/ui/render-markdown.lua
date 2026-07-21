-- render-markdown.nvim — Markdown preview rendering inside buffers
require("render-markdown").setup({
  file_types = { "markdown", "Avante" },
})

vim.keymap.set("n", "<leader>um", "<cmd>RenderMarkdown toggle<cr>", { desc = "Toggle Render Markdown" })
