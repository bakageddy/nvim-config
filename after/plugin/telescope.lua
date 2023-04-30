local builtin = require("telescope.builtin")

require("telescope").setup {
	pickers = {
		-- find_files = {
		-- 	theme = "ivy"
		-- },
		live_grep = {
			theme = "cursor"
		}

	}
}

vim.keymap.set("n", "<LEADER>tf", function() builtin.find_files({hidden = true}) end, {})
vim.keymap.set("n", "<LEADER>tn", function() builtin.find_files({cwd = "~/.config", hidden = true, noignore=true}) end, {})
vim.keymap.set("n", "<LEADER>tg", function() builtin.live_grep() end, {})
vim.keymap.set("n", "<LEADER>tb", function() builtin.buffers() end, {})
vim.keymap.set("n", "<LEADER>tc", function() builtin.colorscheme() end, {})
