-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Always show the signcolumn, otherwise text would shift when displaying error icons
vim.opt.signcolumn = "yes"

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Tab and indentation defaults
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.smarttab = true
-- vim.opt.softtabstop = 0 -- optional

-- Highlight the current line for cursor
vim.opt.cursorline = true

-- Display settings
vim.opt.wrap = false
vim.opt.scrolloff = 8 -- Keep 8 lines above/below the cursor
vim.opt.sidescrolloff = 8 -- Keep 8 columns to the left/right of the cursor
vim.opt.termguicolors = true -- Enable true color support

-- Save undo history
vim.opt.undofile = true

-- Split completion settings
vim.opt.wildmenu = true
vim.opt.wildignorecase = true
vim.opt.wildmode = "longest,full,full"

-- Disable backup and swap files
vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.writebackup = false

-- Faster update time
vim.opt.updatetime = 300

-- Column and ruler settings
vim.opt.ruler = true

-- Global substitution by default
vim.opt.gdefault = true

-- Disable mouse
vim.opt.mouse = ""

vim.opt.clipboard = "unnamedplus"
