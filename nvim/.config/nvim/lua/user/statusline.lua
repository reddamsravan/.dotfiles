local M = {
	'nvim-lualine/lualine.nvim',
	priority = 1000
}

function M.config()
	vim.o.showmode = false
	require('lualine').setup {
		options = {
			component_separators = { left = '', right = '' },
			section_separators = { left = '', right = '' },
			theme = 'auto'
		}
	}
end

return M
