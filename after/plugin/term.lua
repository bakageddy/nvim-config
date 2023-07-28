local term = require "FTerm"

term.setup {
	border = 'rounded',
	blend = 20,
}

vim.keymap.set('n', [[<C-\>]], function()
	term.toggle()
end, {})

vim.keymap.set('t', [[<C-\>]], function()
	term.toggle() 
end, {})
