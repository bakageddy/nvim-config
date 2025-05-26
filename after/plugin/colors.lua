local gruvbox = require 'gruvbox'
local modus = require 'modus-themes'

local global_hl = function(group, settings)
	vim.api.nvim_set_hl(0, group, settings)
end

function ColorMe()
	vim.opt.background = 'dark'
	gruvbox.setup {
		terminal_colors = false,
		bold = false,
		contrast = "hard",
		invert_selection = true,
		italic = {
			string = false,
			keyword = false,
			comment = false,
		},
		palette_overrides = {
			-- bright_red = "#ff5f5f",
			-- red = "#ff5f5f",
			bright_yellow = "#febe2e",
			light1 = "#d4be98"
		},

		overrides = {
			TelescopePromptTitle = { fg = "#1d2021", bg = "#fe8019" },
			TelescopeTitle = { fg = "#1d2021", bg = "#8ec07c" },
			TelescopePreviewTitle = { fg = "#1d2021", bg = "#febe2e" },
			TelescopePreviewBorder = { fg = "#febe2e" },
			TelescopeTitleBorder = { fg = "#8ec07c" },
			TelescopePromptBorder = { fg = "#fe8019" },
			SignColumn = { fg = "#1d2021", bg = "#1d2021" },
			FloatBorder = { bg = "#1d2021" },
			Delimiter = { fg = "#d4be98" },
			["@punctuation.bracket"] = { fg = gruvbox.palette.bright_orange },
			["@module"] = { fg = gruvbox.palette.bright_aqua},
			["@namespace"] = {link = "@module"},
			["@keyword"] = {fg = gruvbox.palette.bright_red, italic = true},
			["@keyword.type"] = {link = "Structure"},
			["@type.builtin"] = {link = "Special"}
		}
	}

	modus.setup {
		on_highlights = function(highlight, color)
			highlight["@variable"] = { fg = color.fg }
			highlight["@variable.parameter"] = { fg = color.cyan }
		end
	}

	vim.cmd.colorscheme [[kanso-zen]]
	global_hl("Visual", {
		reverse = true
	})
	global_hl("VisualNOS", {
		link = "Visual",
	})
	global_hl("SignColumn", {
		link = "Normal",
	})
	global_hl("@type.builtin", {
		link = "Type"
	})

end

ColorMe()
