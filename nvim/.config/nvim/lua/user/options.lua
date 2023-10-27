vim.opt.backup = false            -- disable backup
vim.opt.clipboard = 'unnamedplus' -- access system clipboard
vim.opt.expandtab = true          -- convert tabs to spaces
vim.opt.hlsearch = true           -- highlight all matches on previous search pattern
vim.opt.ignorecase = true         -- ignore case in search patterns
vim.opt.mouse = 'a'               -- enable mouse
vim.opt.relativenumber = true     -- relative line numbering
vim.opt.shiftwidth = 4            -- the number of spaces inserted for each indentation
vim.opt.showmode = false          -- we don't need to see things like -- INSERT -- anymore
vim.opt.signcolumn = 'yes'        -- always show the sign column, otherwise it would shift the text each time
vim.opt.splitbelow = true         -- force all horizontal splits to go below current window
vim.opt.splitright = true         -- force all vertical splits to go to the right of current window
vim.opt.swapfile = false          -- creates a swapfile
vim.opt.tabstop = 4               -- insert 4 spaces for a tab
vim.opt.termguicolors = true      -- set term gui colors (most terminals support this)
vim.opt.timeoutlen = 500          -- time to wait for a mapped sequence to complete (in milliseconds)
vim.opt.undofile = true           -- enable persistent undo
vim.opt.updatetime = 100          -- faster completion (4000ms default)
vim.opt.writebackup = false       -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited