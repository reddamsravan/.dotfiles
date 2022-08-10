local o = vim.opt

-- Backup & Swap
o.backup = false
o.swapfile = false

-- Colors
o.termguicolors = true
o.cursorline = true

-- Command line
o.cmdheight = 1

-- Completions
o.completeopt = { 'menuone', 'noselect' }
o.shortmess:append("c")

-- Indentation
o.tabstop = 4
o.softtabstop = 4
o.shiftwidth = 4
o.expandtab = true
o.smartindent = true

-- Line numbers
o.number = true
o.relativenumber = true
o.numberwidth = 3

-- Line wrapping
o.wrap =  false

-- Search
o.hlsearch = false
o.incsearch = true
o.ignorecase = true
o.smartcase = true

-- Signs
o.signcolumn = "yes"

-- Timings
o.timeoutlen = 500
o.updatetime = 50

-- Windows
o.splitbelow = true
o.splitright = true
o.scrolloff = 8

-- <Space> = <leader>
vim.g.mapleader = ' '

