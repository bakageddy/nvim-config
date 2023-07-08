local signs = require("gitsigns")
local neogit = require("neogit")

signs.setup {
	signs = {
		add = { text = '+' },
		change = { text = '~' },
		delete = { text = 'x'},
		topdelele = { text = '~' },
		changedelete = { text = '~' },
	}
}
neogit.setup {}
