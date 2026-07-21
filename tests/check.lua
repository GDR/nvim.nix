local failures = {}

if vim.g.dotfiles_config_status ~= "ok" then
  table.insert(failures, "Neovim configuration status: " .. tostring(vim.g.dotfiles_config_status))
  for _, err in ipairs(vim.g.dotfiles_config_errors or {}) do
    table.insert(failures, err)
  end
end

local required_plugins = {
  "diffview",
  "oil",
  "lazydev",
  "neogit",
  "refactoring",
  "avante",
  "treesitter-context",
  "grug-far",
  "outline",
  "render-markdown",
  "nvim-surround",
  "smart-splits",
  "catppuccin",
}

for _, plugin in ipairs(required_plugins) do
  local ok, err = pcall(require, plugin)
  if not ok then
    table.insert(failures, "Required plugin failed to load: " .. plugin .. " -> " .. tostring(err))
  end
end

local executables = {
  -- LSP servers
  "clangd",
  "pyright-langserver",
  "nil",
  "bash-language-server",
  "lua-language-server",
  "rust-analyzer",
  "gopls",
  "typescript-language-server",
  "starpls",

  -- Formatters & Linters
  "stylua",
  "nixpkgs-fmt",
  "black",
  "gofumpt",
  "prettier",
  "clang-format",
  "rustfmt",
  "shfmt",
  "buildifier",

  -- Linters and search tools
  "shellcheck",
  "git",
  "rg",
  "fd",
}

for _, executable in ipairs(executables) do
  if vim.fn.executable(executable) ~= 1 then
    table.insert(failures, "Missing runtime executable: " .. executable)
  end
end

if #failures > 0 then
  io.stderr:write(table.concat(failures, "\n") .. "\n")
  vim.cmd("cquit 1")
end

vim.cmd("qa")
