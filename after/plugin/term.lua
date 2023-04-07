local term = require "FTerm"

term.setup {
	border = 'single'
}

vim.keymap.set('n', [[<C-\>]], function()
	term.toggle()
end, {})

vim.keymap.set('t', [[<C-\>]], function()
	term.toggle() 
end, {})
