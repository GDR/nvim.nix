-- lazydev.nvim — Faster Lua LS annotations for Neovim config & plugins
require("lazydev").setup({
  library = {
    { path = "${3rd}/luv/library", words = { "vim%.uv" } },
    { path = "Snacks", words = { "Snacks" } },
  },
})
