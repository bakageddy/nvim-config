local telescope = require('telescope')
local builtin = require("telescope.builtin")

telescope.setup {
	extensions = {
		fzf = {
			fuzzy = true,
			override_generic_sorter = true,
			override_file_sorter = true,
			case_mode = "smart_case",
		},
		file_browser = {
			theme = "ivy",
			hijack_netrw = true,
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
vim.keymap.set("n", "<LEADER>tgb", function() builtin.git_branches() end, {})
vim.keymap.set("n", "<LEADER>tg", function() builtin.live_grep() end, {})
vim.keymap.set("n", "<LEADER>tb", function() builtin.buffers() end, {})
vim.keymap.set("n", "<LEADER>tc", function() builtin.colorscheme() end, {})
vim.keymap.set("n", "<LEADER>tx", function() telescope.extensions.file_browser.file_browser() end)
vim.keymap.set("n", "<LEADER>to", function() builtin.oldfiles() end, {})
