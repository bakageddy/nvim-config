local builtin = require("telescope.builtin")

vim.keymap.set("n", "<LEADER>tf", function() builtin.find_files({hidden = true}) end, {})
vim.keymap.set("n", "<LEADER>tn", function() builtin.find_files({cwd = "~/.config", hidden = true}) end, {})
vim.keymap.set("n", "<LEADER>tg", function() builtin.live_grep() end, {})
vim.keymap.set("n", "<LEADER>tb", function() builtin.buffers() end, {})
vim.keymap.set("n", "<LEADER>tc", function() builtin.colorscheme() end, {})
