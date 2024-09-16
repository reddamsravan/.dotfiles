return {
	'echasnovski/mini.nvim',
	version = false,
	config = function()
		local options = { expr = true }

		-- icons
		require('mini.icons').setup()

		-- start screen
		require('mini.starter').setup()

		-- comment
		require('mini.comment').setup()

		-- text objects
		require('mini.ai').setup()

		-- auto pairs
		require('mini.pairs').setup()

		-- File tree
		require('mini.files').setup()
		vim.keymap.set('n', '\\', MiniFiles.open)

		-- find any
		require('mini.pick').setup()
		vim.keymap.set('n', '<leader>sf', MiniPick.builtin.files)
		vim.keymap.set('n', '<leader>sb', MiniPick.builtin.buffers)
		vim.keymap.set('n', '<leader>sg', MiniPick.builtin.grep_live)
		vim.keymap.set('n', '<leader>sh', MiniPick.builtin.help)

		-- surround
		require('mini.surround').setup()

		-- statusline
		local statusline = require 'mini.statusline'
		-- set use_icons to true if you have a Nerd Font
		statusline.setup { use_icons = false, }
		---@diagnostic disable-next-line: duplicate-set-field
		statusline.section_location = function()
			return '%2l:%-2v'
		end
	end
}
