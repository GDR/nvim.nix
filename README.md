<div align="center">

# ⚡ nvim.nix

### *Modular, Lua-first Neovim packaged with Nix magic*

[![Nix Flake](https://img.shields.io/badge/Nix_Flake-5772B4?style=for-the-badge&logo=nixos&logoColor=white)](https://github.com/GDR/nvim.nix)
[![Neovim](https://img.shields.io/badge/Neovim-000000?style=for-the-badge&logo=neovim&logoColor=57A143)](https://neovim.io)
[![Lua](https://img.shields.io/badge/Lua-2C2D72?style=for-the-badge&logo=lua&logoColor=white)](https://www.lua.org)
[![License](https://img.shields.io/badge/License-MIT-green.svg?style=for-the-badge)](LICENSE)

An opinionated, fast, and feature-rich Neovim editor configuration with pre-configured LSPs, formatters, linters, and modern UI plugins — **batteries included & zero host pollution**.

[Quick Start](#-quick-start) • [Overview](#-overview) • [Language Matrix](#-language--tooling-matrix) • [Plugins](#-included-extensions--plugins) • [Keymaps](#-keybindings-cheat-sheet) • [Flake Integration](#-flake-integration)

</div>

---

## 💡 Overview

`nvim.nix` provides an instant, IDE-grade Neovim environment completely packaged with Nix. Rather than relying on global system packages or manual plugin managers, all runtime binaries — including **Language Servers (LSP)**, **Formatters**, **Linters**, and **CLI Tools** — are declaratively managed and injected directly into Neovim's isolated `$PATH`.

<table width="100%">
  <tr>
    <td width="33%" align="center">
      <h3>❄️ Zero Host Pollution</h3>
      <p>LSPs, formatters, and tools run in Nix wrapper isolation — leaving your operating system completely pristine.</p>
    </td>
    <td width="33%" align="center">
      <h3>⚡ Pure Lua Engine</h3>
      <p>Modular configuration files live in standard Lua under <code>dotfiles/nvim/lua</code> with live reloading on save.</p>
    </td>
    <td width="33%" align="center">
      <h3>🚀 Runnable Anywhere</h3>
      <p>Execute immediately on any Linux or macOS machine with standard Nix installed using a single <code>nix run</code> command.</p>
    </td>
  </tr>
</table>

---

## 🚀 Quick Start

> [!TIP]
> **No installation needed!** Try out the full Neovim setup in an isolated environment without altering your system configuration.

### 🏃 One-Liner Tryout
```bash
nix run github:GDR/nvim.nix
```

### 📥 Install to Nix Profile
```bash
nix profile install github:GDR/nvim.nix
```

---

## 🧠 Language & Tooling Matrix

All language servers, code formatters, and static linters are pre-wired and automatically invoked on file load or save.

| Language / Tech | Language Server (LSP) | Formatter (`conform.nvim`) | Linter (`nvim-lint`) |
| :--- | :--- | :--- | :--- |
| 🦀 **Rust** | `rust-analyzer` | `rustfmt` | — |
| 🐹 **Go** | `gopls` | `gofumpt` | — |
| 🐍 **Python** | `pyright` | `black` | — |
| ⚡ **C / C++** | `clangd` | `clang-format` | — |
| ❄️ **Nix** | `nil` | `nixpkgs-fmt` | — |
| 🌐 **TypeScript / JS** | `typescript-language-server` | `prettier` | — |
| 🌙 **Lua** | `lua-language-server` | `stylua` | — |
| 🐚 **Bash / Shell** | `bash-language-server` | `shfmt` | `shellcheck` |
| 📦 **Bazel / Starlark** | `starpls` | `buildifier` | `buildifier` |

> **Bundled CLI Utilities**: `ripgrep` *(fast text search)*, `fd` *(fast file discovery)*, `git` *(gutter status & blame)*, `tree-sitter` *(grammar parser generation)*.

---

## 🧩 Included Extensions & Plugins

`nvim.nix` features a curated collection of modern Neovim plugins configured for speed, visual beauty, and ergonomic editing.

### 🎨 UI & Aesthetics
| Extension / Plugin | Description |
| :--- | :--- |
| 🌆 **[`tokyonight.nvim`](https://github.com/folke/tokyonight.nvim)** / 🐱 **[`catppuccin`](https://github.com/catppuccin/nvim)** | Sleek, vibrant dark & light color palettes |
| 📊 **[`lualine.nvim`](https://github.com/nvim-lualine/lualine.nvim)** | Ultra-fast statusline with git branch, LSP status & diagnostics |
| 📑 **[`bufferline.nvim`](https://github.com/akinsho/bufferline.nvim)** | VS Code-style buffer tabbar with icons and quick tab switching |
| 💎 **[`noice.nvim`](https://github.com/folke/noice.nvim)** | Complete UI overhaul for `cmdline`, search popups, and floating messages |
| 🍿 **[`snacks.nvim`](https://github.com/folke/snacks.nvim)** | Feature-packed dashboard, indent guides, git browse, and input overlays |
| ⌨️ **[`which-key.nvim`](https://github.com/folke/which-key.nvim)** | Interactive keybinding popup helper displaying available shortcuts |
| 👗 **[`dressing.nvim`](https://github.com/stevearc/dressing.nvim)** | Enhanced modal dialogs for `vim.ui.select` and `vim.ui.input` |
| 📝 **[`render-markdown.nvim`](https://github.com/MeanderingProgrammer/render-markdown.nvim)** | Beautiful inline markdown rendering inside Neovim buffers |
| 🪟 **[`smart-splits.nvim`](https://github.com/mrjones2014/smart-splits.nvim)** | Multiplexer-aware split navigation (tmux / WezTerm / Kitty) |
| 🔔 **[`nvim-notify`](https://github.com/rcarriga/nvim-notify)** | Smooth, animated notification manager |

### 🛠️ Navigation & File Management
| Extension / Plugin | Description |
| :--- | :--- |
| 🌲 **[`neo-tree.nvim`](https://github.com/nvim-neo-tree/neo-tree.nvim)** | Sidebar file explorer with Git status indicators and file icons |
| 🔍 **[`telescope.nvim`](https://github.com/nvim-telescope/telescope.nvim)** | Modular fuzzy finder over files, buffers, git commits, and LSP symbols |
| ⚡ **[`telescope-fzf-native`](https://github.com/nvim-telescope/telescope-fzf-native.nvim)** | Native C-based fzf sorter for instant Telescope search results |
| 🛢️ **[`oil.nvim`](https://github.com/stevearc/oil.nvim)** | Edit directory layouts directly like a standard text buffer |
| ⚡ **[`flash.nvim`](https://github.com/folke/flash.nvim)** | Lightning-fast target labels for jumping across visible text |
| 🔎 **[`grug-far.nvim`](https://github.com/MagicDuck/grug-far.nvim)** | Project-wide search and replace interface with live previews |
| 📑 **[`outline-nvim`](https://github.com/hedyhli/outline-nvim)** | Tree view sidebar displaying functions, classes, and variables |
| 💾 **[`persistence-nvim`](https://github.com/folke/persistence.nvim)** | Automated session saving and workspace restoration |
| ⚙️ **[`direnv.vim`](https://github.com/direnv/direnv.vim)** | Automatic project environment switcher via `direnv` |

### ⚡ Coding & Editing Toolkit
| Extension / Plugin | Description |
| :--- | :--- |
| ⚡ **[`blink-cmp`](https://github.com/Saghen/blink.cmp)** | High-performance asynchronous autocompletion engine |
| 🌳 **[`nvim-treesitter`](https://github.com/nvim-treesitter/nvim-treesitter)** | Tree-sitter AST syntax parser with all language grammars pre-installed |
| 📌 **[`nvim-treesitter-context`](https://github.com/nvim-treesitter/nvim-treesitter-context)** | Sticky headers displaying current function/class context at buffer top |
| ✂️ **[`luasnip`](https://github.com/L3MON4D3/LuaSnip)** | Snippet engine with code expansions and custom snippets |
| 🧰 **[`mini.nvim`](https://github.com/echasnovski/mini.nvim)** | Essential modules: `mini.surround` (brackets/quotes), `mini.ai`, `mini.pairs` |
| 🚜 **[`refactoring.nvim`](https://github.com/ThePrimeagen/refactoring.nvim)** | Automated code refactoring (extract variable/function, inline) |
| 🌙 **[`lazydev.nvim`](https://github.com/folke/lazydev.nvim)** | Full Lua LSP completions for Neovim config & plugin development |

### 🌿 Git & Build Tools
| Extension / Plugin | Description |
| :--- | :--- |
| 🐙 **[`gitsigns.nvim`](https://github.com/lewis6991/gitsigns.nvim)** | Git diff indicators in sign column, line blame, & hunk actions |
| 👁️ **[`diffview.nvim`](https://github.com/sindrets/diffview.nvim)** | Dedicated tabbed Git diff and file revision history viewer |
| 🏛️ **[`neogit`](https://github.com/NeogitOrg/neogit)** | Magit-inspired full Git control panel inside Neovim |
| 📦 **[`vim-bazel`](https://github.com/bazelbuild/vim-bazel)** | Bazel target building and automated test runner |

### 🤖 AI Coding Assistant
| Extension / Plugin | Description |
| :--- | :--- |
| 🤖 **[`avante.nvim`](https://github.com/yetone/avante.nvim)** | Cursor-like AI code completion & side-by-side editing assistant |

---

## ⌨️ Keybindings Cheat Sheet

Below are some essential keymaps configured out of the box (press `<Space>` for the `which-key` menu):

| Shortcut | Action |
| :--- | :--- |
| `<C-h>` / `<C-j>` / `<C-k>` / `<C-l>` | Navigate between split windows |
| `<Shift-h>` / `<Shift-l>` | Switch to previous / next buffer |
| `<leader>bd` | Close current buffer |
| `<leader>w` | Save current file |
| `<leader>q` | Quit Neovim |
| `<leader>fn` | Open new buffer |
| `<leader>cd` | Open floating line diagnostics |
| `[d` / `]d` | Jump to previous / next diagnostic |
| `<leader>ur` | Redraw screen & clear search highlights |
| `<leader>R` | Soft restart Neovim runtime |

---

## 📦 Flake Integration

Add `nvim.nix` as an input in your `flake.nix` to integrate it into your NixOS or Home Manager system setup:

```nix
{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nvim.url = "github:GDR/nvim.nix";
  };

  outputs = { self, nixpkgs, nvim }: {
    # Access the wrapped Neovim package for your architecture:
    # nvim.packages.${system}.default
  };
}
```

---

## 📁 Repository Layout

```
nvim.nix/
├── flake.nix              # Flake outputs (packages, apps, checks)
├── dotfiles/
│   ├── package.nix        # nix-wrapper-modules package wrapper definition
│   ├── plugins.nix        # Plugin specs & runtime LSP environment
│   └── nvim/              # Modular Lua Neovim configuration files
│       ├── init.lua       # Main entry point
│       └── lua/
│           ├── config/    # Keymaps, options, and autocommands
│           └── plugins/   # Per-plugin Lua configurations
└── tests/                 # Automated flake health checks
```

---

## 📄 License

MIT © [Damir Garifullin](https://github.com/GDR)
