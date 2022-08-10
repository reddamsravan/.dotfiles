local M = {}

local function modemap(mode, default_options)
    default_options = default_options or { noremap = true }
    return function(binding, execution, options)
        options = vim.tbl_extend('force', default_options, options or {})
        vim.keymap.set(mode, binding, execution, options)
    end
end

M.nmap = modemap('n', { noremap = false })
M.nnoremap = modemap('n')
M.inoremap = modemap('i')
M.vnoremap = modemap('v')
M.xnoremap = modemap('x')

return M
