local kanagawa = require 'kanagawa'
function ColorMe()
	kanagawa.setup {
		overrides = function(colors)
			return {
				Visual = { reverse = true },
				SignColumn = {fg = "#1f1f28", bg = "#1f1f28"}
			}
		end,
		theme = "wave",
	}
	vim.cmd.colorscheme [[kanagawa]]
end

ColorMe()
