local o = vim.opt

-- TODO investigate
o.termguicolors = true

-- leader
vim.g.mapleader = '\\'

-- editor
o.mouse = 'a'
o.number = true
o.cursorline = true
o.colorcolumn = '120'
o.signcolumn = 'yes'
o.scrolloff = 8

-- indent
o.expandtab = true
o.smarttab = true
o.tabstop = 2
o.shiftwidth = 2

-- search
o.hlsearch = true
o.incsearch = true
o.ignorecase = true
o.smartcase = true

-- splits
o.splitbelow = true
o.splitright = true

o.swapfile = false