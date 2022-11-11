local status_ok, configs = pcall(require, 'lualine')
if not status_ok then
    return
end

local options = {
    theme = 'kanagawa',
    section_separators = { left = '', right = '' },
    component_separators = { left = '', right = '' },
    globalstatus = true,
}

local sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress', 'searchcount'},
    lualine_z = {'location'}
}

configs.setup({
    options = options,
    sections = sections
})
