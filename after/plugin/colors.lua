local kanagawa = require 'kanagawa'
local gruvbox = require 'gruvbox'
-- local solarized = require 'solarized'
-- local modus = require "modus-themes"

function ColorMe()
	-- local p = require("solarized.palette")
	-- local solarized_colors = p.get_colors()

	gruvbox.setup {
		terminal_colors = false,
		invert_selection = true,
		contrast = "hard",
		palette_overrides = {
			-- red = "#ff5f5f",
			-- bright_red = "#ff5f5f",
			light1 = "#d4be98"
		},
		overrides = {
			TelescopePromptTitle = { fg = gruvbox.palette.dark0_hard, bg = gruvbox.palette.bright_orange },
			TelescopeTitle = { fg = gruvbox.palette.dark0_hard, bg = gruvbox.palette.bright_aqua },
			TelescopePreviewTitle = { fg = gruvbox.palette.dark0_hard, bg = gruvbox.palette.bright_yellow },
			TelescopePreviewBorder = { fg = gruvbox.palette.bright_yellow },
			TelescopeTitleBorder = { fg = gruvbox.palette.bright_aqua },
			TelescopePromptBorder = { fg = gruvbox.palette.bright_orange },
			FloatBorder = { bg = gruvbox.palette.dark0_hard },
			SignColumn = { fg = gruvbox.palette.dark0_hard, bg = gruvbox.palette.dark0_hard },
			["@punctuation.bracket"] = { fg = gruvbox.palette.bright_orange },
			["@module"] = { fg = gruvbox.palette.bright_aqua },
			["@namespace"] = { link = "@module" },
			["@keyword"] = {fg = gruvbox.palette.bright_red, italic = true},
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

	-- solarized.setup {
	-- 	theme = 'neo',
	-- 	highlights = function(colors)
	-- 		return {
	-- 			SignColumn = { bg = colors.bg },
	-- 			Visual = { reverse = true },
	-- 			TelescopeNormal = { fg = colors.bg },
	-- 		}
	-- 	end,
	-- }

	-- modus.setup {
	-- 	on_colors = function(colors)
	-- 	end,
	-- 	on_highlights = function(highlight, color)
	-- 		highlight.Cursor = { bg = "#000000", fg = "#000000" }
	-- 	end
	-- }
	-- local shour = os.date("%H", os.time())
	-- local hour = tonumber(shour)
	-- if hour == nil then
	-- 	vim.cmd.colorscheme [[modus_vivendi]]
	-- elseif hour >= 9 and hour <= 17 then
	-- 	vim.cmd.colorscheme [[modus_operandi]]
	-- else
	-- 	vim.cmd.colorscheme [[modus_vivendi]]
	-- end

	vim.cmd.colorscheme [[gruvbox]]
end

ColorMe()
