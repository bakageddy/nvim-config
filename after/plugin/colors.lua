local kanagawa = require 'kanagawa'
function ColorMe()
	kanagawa.setup {
		overrides = function(colors)
			return {
				Visual = { reverse = true },
			}
		end,
		theme = "wave",
	}
	vim.cmd.colorscheme [[kanagawa]]
end

ColorMe()
