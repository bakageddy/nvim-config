-- local kanagawa = require 'kanagawa'
local gruvbox = require 'gruvbox'

function ColorMe()
	gruvbox.setup {
		invert_selection = true,
		contrast = "hard",
		overrides = {
			TelescopePromptTitle = {fg = "#1d2021", bg = "#fe8019" },
			TelescopeTitle = {fg = "#1d2021", bg = "#8ec07c"},
			TelescopePreviewTitle = {fg = "#1d2021", bg = "#FABD2F"},
			TelescopePreviewBorder = {fg = "#fabd2f"},
			TelescopeTitleBorder = {fg = "#8ec07c"},
			TelescopePromptBorder = {fg = "#fe8019"},
		}
	}
	-- kanagawa.setup {
	-- 	overrides = function(colors)
	-- 		return {
	-- 			Visual = { reverse = true },
	-- 			FloatBorder = {bg = "#1f1f28"},
	-- 			SignColumn = {fg = "#1f1f28", bg = "#1f1f28"}
	-- 		}
	-- 	end,
	-- 	theme = "wave",
	-- }
	vim.cmd.colorscheme [[gruvbox]]
end

ColorMe()
