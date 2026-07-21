# ⚡ nvim.nix

> Modular, Lua-first Neovim configuration packaged with Nix & `nix-wrapper-modules`.

[![Nix Flake](https://img.shields.io/badge/Nix_Flake-blue?logo=nixos&logoColor=white)](https://github.com/GDR/nvim.nix)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

An opinionated, fast, and feature-rich Neovim editor configuration with pre-configured LSPs, formatters, linters, and modern UI plugins — battery-included and runnable everywhere via Nix.

---

## 🚀 Quick Start

### Try Instantly (No Installation Required)

Try the full Neovim setup anywhere with standard Nix installed:

```bash
nix run github:GDR/nvim.nix
```

### Install to Nix Profile

```bash
nix profile install github:GDR/nvim.nix
```

---

## 📦 Flake Integration

Add `nvim.nix` as an input in your `flake.nix`:

```nix
{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nvim.url = "github:GDR/nvim.nix";
  };

  outputs = { self, nixpkgs, nvim }: {
    # Access the wrapped Neovim package:
    # nvim.packages.${system}.default
  };
}
```

---

## ✨ Features

- **⚡ Instant Lua Reloads**: Configuration lives in standard Lua files, allow live updates without rebuilds.
- **🛠️ Battery-Included LSPs**: Pre-packaged runtime language servers (`nil`, `rust-analyzer`, `pyright`, `clangd`, `gopls`, `tsserver`, `bash-language-server`).
- **🧹 Pre-configured Formatters & Linters**: Includes `stylua`, `nixpkgs-fmt`, `black`, `prettier`, `shfmt`, `shellcheck`, and `clang-format`.
- **🎨 Modern UI & Experience**: Powered by `tokyonight`, `snacks.nvim`, `noice.nvim`, `trouble.nvim`, and `which-key.nvim`.

---

## 📁 Repository Layout

```
nvim.nix/
├── flake.nix              # Flake outputs (packages, apps, checks)
├── dotfiles/
│   ├── package.nix        # nix-wrapper-modules package definition
│   ├── plugins.nix        # Plugin specs & runtime LSP environment
│   └── nvim/              # Pure Lua Neovim configuration files
└── tests/                 # Automated health checks
```

---

## 📄 License

MIT © [Damir Garifullin](https://github.com/GDR)
