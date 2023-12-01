local M = {
	"nvim-neo-tree/neo-tree.nvim",
	branch = 'v3.x',
	dependencies = {
		'nvim-lua/plenary.nvim',
		'nvim-tree/nvim-web-devicons',
		'MunifTanjim/nui.nvim'
	}
}

function M.config()
	vim.g.loaded_netrw = 1
	vim.g.loaded_netrwPlugin = 1

	require('neo-tree').setup({
		default_component_configs = {
			git_status = {
				symbols = {
					added = 'a',
					modified = 'm',
					deleted = 'd',
					renamed = 'r',
					untracked = 'u',
					ignored = 'i',
					unstaged = 'us',
					staged = 's',
					conflict = 'c',
				}
			}
		}
})

	vim.keymap.set('n', '<leader>x', '<cmd>Neotree toggle<CR>')
end

return M
