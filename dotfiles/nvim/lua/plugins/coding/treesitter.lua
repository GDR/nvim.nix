-- Treesitter — syntax highlighting, text objects, indent
-- Grammars are pre-installed by Nix (withAllGrammars in plugins.nix)
-- No need for nvim-treesitter.configs — use built-in Neovim treesitter APIs

-- Enable treesitter highlighting for all supported filetypes
local function start_treesitter(buf)
  buf = buf or vim.api.nvim_get_current_buf()
  if vim.api.nvim_buf_is_valid(buf) and vim.bo[buf].filetype ~= "" then
    pcall(vim.treesitter.start, buf)
  end
end

vim.api.nvim_create_autocmd({ "FileType", "BufReadPost" }, {
  group = vim.api.nvim_create_augroup("treesitter_start", { clear = true }),
  callback = function(ev)
    start_treesitter(ev.buf)
  end,
})

-- Start treesitter for buffers already loaded before this plugin file was required
for _, buf in ipairs(vim.api.nvim_list_bufs()) do
  if vim.api.nvim_buf_is_loaded(buf) then
    start_treesitter(buf)
  end
end

-- Enable treesitter-based indentation
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldenable = false -- don't fold by default
vim.opt.foldlevel = 99

-- Incremental selection via nvim-treesitter (if available)
local ok, configs = pcall(require, "nvim-treesitter.configs")
if ok then
  configs.setup({
    highlight = { enable = true },
    indent = { enable = true },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "<C-space>",
        node_incremental = "<C-space>",
        scope_incremental = false,
        node_decremental = "<bs>",
      },
    },
  })
end
