local kanagawa = require 'kanagawa'
local gruvbox = require 'gruvbox'

function ColorMe()
	gruvbox.setup {
		invert_selection = true,
		contrast = "hard",
	}
	kanagawa.setup {
		overrides = function(colors)
			return {
				Visual = { reverse = true },
				FloatBorder = {bg = "#1f1f28"},
				SignColumn = {fg = "#1f1f28", bg = "#1f1f28"}
			}
		end,
		theme = "wave",
	}
	vim.cmd.colorscheme [[retrobox]]
end

ColorMe()
