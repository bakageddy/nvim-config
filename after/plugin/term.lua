local term = require "toggleterm"

term.setup {
	direction = 'float',
	border = 'curved'
}

vim.keymap.set('n', [[<C-\>]], function()
	term.toggle()
end, {})

vim.keymap.set('t', [[<C-\>]], function()
	term.toggle()
end, {})

vim.keymap.set('n', [[<LEADER>te]], function ()
	vim.cmd [[ToggleTermSendCurrentLine]]
end)
