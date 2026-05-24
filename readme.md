# Neovim Configuration 👨‍💻

My personal Neovim setup — a modular, plugin-rich configuration built with
[Lazy.nvim](https://github.com/folke/lazy.nvim), with first-class support for
**C# / .NET**, **TypeScript / Vue**, **Python**, and more.

If you find it useful, a 🌟 is always appreciated!

---

## ✨ Features

- ⚡ **Lazy-loaded** plugin management with [`lazy.nvim`](https://github.com/folke/lazy.nvim)
- 🧠 **14+ LSP servers** preconfigured (C#, TS/JS, Vue, Python, Lua, HTML, CSS, Tailwind, JSON, Docker, Bash, YAML, Markdown, C/C++…)
- 🎨 **Dynamic theming** via [Omarchy](https://github.com/basecamp/omarchy) — colorscheme follows the system theme automatically
- 🔧 **Modern formatting & linting** with [`conform.nvim`](https://github.com/stevearc/conform.nvim) and [`nvim-lint`](https://github.com/mfussenegger/nvim-lint)
- 🐛 **Debugging** with [`nvim-dap`](https://github.com/mfussenegger/nvim-dap) + `dap-ui`
- 🌳 **Treesitter** highlighting and parsing
- 🔍 **Fuzzy finder** powered by [`telescope.nvim`](https://github.com/nvim-telescope/telescope.nvim)
- 📁 **File explorer** via [`neo-tree.nvim`](https://github.com/nvim-neo-tree/neo-tree.nvim)
- 🪄 **Snippets** with LuaSnip (plus custom C# snippets for MediatR, DTOs, validators…)
- 📊 **Statusline** with [`lualine.nvim`](https://github.com/nvim-lualine/lualine.nvim)
- 🗂️ **Git integration** via [`neogit`](https://github.com/NeogitOrg/neogit)
- ⌨️ **Key hints** with [`which-key.nvim`](https://github.com/folke/which-key.nvim)

---

## 📋 Requirements

- **Neovim** ≥ 0.11
- **git**, **make**, **gcc**, **unzip**, **curl**
- **ripgrep** (for Telescope live grep)
- **A Nerd Font** (for icons)
- **Node.js** (for several LSP servers)
- **.NET SDK** (for C# / OmniSharp)

---

## 🚀 Installation

> ⚠️ Back up any existing Neovim config before proceeding.

```bash
# Backup existing config (if any)
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak

# Clone this repo
git clone https://github.com/EFZR/nvim-configs.git

# Launch Neovim — Lazy.nvim will install everything automatically
nvim
```

On first launch:

1. Lazy installs all plugins
2. Run `:Mason` to verify LSP servers, formatters and linters
3. Restart Neovim

---

## 📁 Structure

```txt
~/.config/nvim/
├── init.lua                 # Entry point
├── lazy-lock.json           # Plugin version lockfile
├── lua/
│   ├── user/                # Core config
│   │   ├── options.lua      # vim.opt settings
│   │   ├── keymaps.lua      # Global keymaps
│   │   ├── autocmds.lua     # Filetype-specific behavior
│   │   ├── languages.lua    # LSP/parser/tool lists
│   │   ├── lazy-setup.lua   # Lazy.nvim bootstrap
│   │   └── csharp.lua       # C# module entry
│   ├── plugins/             # Plugin specs (one file per plugin)
│   └── csharp/              # Custom C# tooling
└── snippets/                # LuaSnip snippets
```

---

## ⌨️ Key Bindings Cheatsheet

Leader key: `<Space>`

### General

| Key         | Action                  |
| ----------- | ----------------------- |
| `<leader>h` | Clear search highlights |
| `<leader>;` | Toggle Alpha dashboard  |
| `<leader>L` | Open Lazy UI            |
| `<leader>m` | Open Mason              |
| `<leader>u` | Toggle Undotree         |
| `\`         | Toggle Neo-tree         |

### Window Navigation

| Key           | Action              |
| ------------- | ------------------- |
| `<C-h/j/k/l>` | Move between splits |
| `<C-Arrow>`   | Resize splits       |

### LSP

| Key          | Action                     |
| ------------ | -------------------------- |
| `gd`         | Go to definition           |
| `gD`         | Go to type definition      |
| `gr`         | List references            |
| `gI`         | List implementations       |
| `K`          | Hover docs                 |
| `gl`         | Open diagnostic float      |
| `]d` / `[d`  | Next / previous diagnostic |
| `<leader>la` | Code action                |
| `<leader>lr` | Rename                     |
| `<leader>lf` | Format buffer              |
| `<leader>ls` | Signature help             |
| `<leader>li` | LSP info                   |

### Telescope

| Key          | Action     |
| ------------ | ---------- |
| `<leader>ff` | Find files |
| `<leader>fg` | Live grep  |
| `<leader>fb` | Buffers    |
| `<leader>ft` | Find TODOs |

### Git (Neogit)

| Key         | Action      |
| ----------- | ----------- |
| `<leader>G` | Open Neogit |

### Debugging (DAP)

| Key         | Action            |
| ----------- | ----------------- |
| `F5`        | Continue / start  |
| `F10`       | Step over         |
| `F11`       | Step into         |
| `F12`       | Step out          |
| `<leader>b` | Toggle breakpoint |

### TODO Comments

| Key          | Action               |
| ------------ | -------------------- |
| `]t` / `[t`  | Next / previous TODO |
| `<leader>ft` | Find all TODOs       |

---

## 🎨 Theming

This config integrates with [Omarchy](https://github.com/basecamp/omarchy) so the
editor's colorscheme follows the system theme automatically. The active theme is
read from `~/.config/omarchy/current/theme/neovim.lua` and mapped to one of 24+
supported colorschemes (catppuccin, everforest, gruvbox, kanagawa, tokyonight…).

If Omarchy isn't installed, it falls back to `bamboo`.

---

## 🧩 Customization

- **Add a new LSP server** — append it to `M.servers` in `lua/user/languages.lua`
- **Add a formatter** — add it to `M.formatters` and the `formatters_by_ft` table in `lua/plugins/none-ls.lua`
- **Add a linter** — add it to `M.linters` and `linters_by_ft` in `lua/plugins/none-ls.lua`
- **Add a Treesitter parser** — append to `M.parsers` in `lua/user/languages.lua`
- **Per-server LSP settings** — drop a file at `lua/user/lspsettings/<server>.lua` returning a settings table

---

## 📜 License

MIT — use it, fork it, break it, fix it. Just have fun.

Happy coding! 🚀
