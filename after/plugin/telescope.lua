local telescope = require 'telescope'
local builtin = require("telescope.builtin")

require("telescope").setup {
	extensions = {
		fzf = {
			fuzzy = true,
			case_mode = 'smart_case',
		},
		file_browser = {
			theme = 'ivy',
		}
	},
	pickers = {
		find_files = {
			theme = "ivy"
		},
		live_grep = {
			theme = "cursor"
		}

	}
}

telescope.load_extension('fzf')
telescope.load_extension('file_browser')

vim.keymap.set("n", "<LEADER>tf", function() builtin.find_files({ hidden = true }) end, {})
vim.keymap.set("n", "<LEADER>tn", function() builtin.find_files({ cwd = "~/.config", hidden = true, noignore = true }) end,
	{})
vim.keymap.set("n", "<LEADER>tg", function() builtin.live_grep() end, {})
vim.keymap.set("n", "<LEADER>tb", function() builtin.buffers() end, {})
vim.keymap.set("n", "<LEADER>tc", function() builtin.colorscheme() end, {})
vim.keymap.set("n", "<LEADER>th", function() builtin.highlights() end, {})
vim.keymap.set("n", "<LEADER>tx", function() telescope.extensions.file_browser.file_browser() end, {})
