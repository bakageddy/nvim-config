local kanagawa = require 'kanagawa'
local gruvbox = require 'gruvbox'
local solarized = require 'solarized'

function ColorMe()
	local p = require("solarized.palette")
	local solarized_colors = p.get_colors()

	gruvbox.setup {
		terminal_colors = false,
		invert_selection = true,
		contrast = "hard",
		palette_overrides = {
			red = "#ff5f5f",
			bright_red = "#ff5f5f",
			light1 = "#d4be98"
		},
		overrides = {
			TelescopePromptTitle = { fg = "#1d2021", bg = "#fe8019" },
			TelescopeTitle = { fg = "#1d2021", bg = "#8ec07c" },
			TelescopePreviewTitle = { fg = "#1d2021", bg = "#FABD2F" },
			TelescopePreviewBorder = { fg = "#fabd2f" },
			TelescopeTitleBorder = { fg = "#8ec07c" },
			TelescopePromptBorder = { fg = "#fe8019" },
			FloatBorder = { bg = "#1d2021" },
			SignColumn = { fg = "#1d2021", bg = "#1d2021" },
			["@punctuation.bracket"] = { fg = "#fe8019" },
		}
	}

	kanagawa.setup {
		overrides = function(_)
			return {
				Visual = { reverse = true },
				FloatBorder = { bg = "#1f1f28" },
				SignColumn = { fg = "#1f1f28", bg = "#1f1f28" }
			}
		end,
		theme = "wave",
	}

	solarized.setup {
		theme = 'neo',
		highlights = function(colors)
			return {
				SignColumn = { bg = colors.bg },
				Visual = { reverse = true },
				TelescopeNormal = { fg = colors.bg },
			}
		end,
	}

	vim.cmd.colorscheme [[gruvbox]]
end

ColorMe()
