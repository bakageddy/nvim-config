local lualine = require 'lualine'
local themes = require 'dinesh.themes'

-- Color table for highlights
-- stylua: ignore
local colors = themes.gruvbox
-- local colors = themes.grayscale_dark
--
local conditions = {
	buffer_not_empty = function()
		return vim.fn.empty(vim.fn.expand '%:t') ~= 1
	end,
	hide_in_width = function()
		return vim.fn.winwidth(0) > 80
	end,
	check_git_workspace = function()
		local filepath = vim.fn.expand '%:p:h'
		local gitdir = vim.fn.finddir('.git', filepath .. ';')
		local hgdir = vim.fn.finddir('.hg', filepath .. ';')
		return (gitdir and #gitdir > 0 and #gitdir < #filepath)
			or (hgdir and #hgdir > 0 and #hgdir < #filepath)
	end,
}

-- Config
local config = {
	globalstatus = true,
	options = {
		-- Disable sections and component separators
		component_separators = '',
		section_separators = '',
		theme = {
			-- We are going to use lualine_c an lualine_x as left and
			-- right section. Both are highlighted by c theme .  So we
			-- are just setting default looks o statusline
			normal = { c = { fg = colors.fg, bg = colors.bg } },
			inactive = { c = { fg = colors.fg, bg = colors.bg } },
		},
	},
	sections = {
		-- these are to remove the defaults
		lualine_a = {},
		lualine_b = {},
		lualine_y = {},
		lualine_z = {},
		-- These will be filled later
		lualine_c = {},
		lualine_x = {},
	},
	inactive_sections = {
		-- these are to remove the defaults
		lualine_a = {},
		lualine_v = {},
		lualine_y = {},
		lualine_z = {},
		lualine_c = {},
		lualine_x = {},
	},
}
local function ins_left(component)
	table.insert(config.sections.lualine_c, component)
end

local function ins_right(component)
	table.insert(config.sections.lualine_x, component)
end

ins_left {
	function()
		return '▊'
	end,
	color = { fg = colors.blue },    -- Sets highlighting of component
	padding = { left = 0, right = 1 }, -- We don't need space before this
}
ins_left {
	-- mode component
	function()
		-- auto change color according to neovims mode
		local mode_color = {
			n = colors.red,
			i = colors.fg,
			v = colors.orange,
			[''] = colors.orange,
			V = colors.bg,
			c = colors.magenta,
			no = colors.red,
			s = colors.orange,
			S = colors.orange,
			[''] = colors.orange,
			ic = colors.yellow,
			R = colors.violet,
			Rv = colors.violet,
			cv = colors.red,
			ce = colors.red,
			r = colors.cyan,
			rm = colors.cyan,
			['r?'] = colors.cyan,
			['!'] = colors.fg,
			t = colors.red,
		}
		vim.api.nvim_command('hi! LualineMode guifg=' .. mode_color[vim.fn.mode()] .. ' guibg=' .. colors.bg)
		return ''
	end,
	color = 'LualineMode',
	padding = { right = 1, left = 0 },
}
-- ins_left {
-- 	-- filesize component
-- 	'filesize',
-- 	cond = conditions.buffer_not_empty,
-- }
ins_left {
	'filename',
	cond = conditions.buffer_not_empty,
	color = { fg = colors.yellow, gui = 'bold' },
}
-- ins_left { 'location' }

-- ins_left { 'progress', color = { fg = colors.fg, gui = 'bold' } }

ins_left { 'location' }

-- ins_left { 'progress', color = { fg = colors.fg, gui = 'bold' } }

ins_left {
  'diagnostics',
  sources = { 'nvim_diagnostic' },
  symbols = { error = 'E ', warn = 'W', info = 'I' },
  diagnostics_color = {
    color_error = { fg = colors.red },
    color_warn = { fg = colors.yellow },
    color_info = { fg = colors.cyan },
  },
}

-- Insert mid section. You can make any number of sections in neovim :)
-- for lualine it's any number greater then 2
ins_left {
	function()
		return '%='
	end,
}

ins_left {
	-- Lsp server name .
	function()
		local msg = 'No Active Lsp'
		local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
		local clients = vim.lsp.get_clients()
		if next(clients) == nil then
			return msg
		end
		for _, client in ipairs(clients) do
			local filetypes = client.config.filetypes
			if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
				return client.name
			end
		end
		return msg
	end,
	icon = ' LSP:',
	color = { fg = colors.cyan, gui = 'italic' },
}
-- ins_right {
-- 	'o:encoding',     -- option component same as &encoding in viml
-- 	fmt = string.upper, -- I'm not sure why it's upper case either ;)
-- 	cond = conditions.hide_in_width,
-- 	color = { fg = colors.green, gui = 'bold' },
-- }
-- ins_right {
-- 	'fileformat',
-- 	fmt = string.upper,
-- 	icons_enabled = true, -- I think icons are cool but Eviline doesn't have them. sigh
-- 	color = { fg = colors.red, gui = 'bold' },
-- }

ins_right {
  'branch',
  icon = '',
  color = { fg = colors.green, gui = 'bold' },
}

ins_right {
	'diff',
	symbols = { added = 'A=', modified = 'M=', removed = 'R=' },
	diff_color = {
		added = { fg = colors.green },
		modified = { fg = colors.orange },
		removed = { fg = colors.red },
	},
	cond = conditions.hide_in_width,
}

ins_right {
	function()
		return '▊'
	end,
	color = { fg = colors.blue },
	padding = { left = 1 },
}

-- Add components to right sections
-- ins_right {
--   'o:encoding', -- option component same as &encoding in viml
--   fmt = string.upper, -- I'm not sure why it's upper case either ;)
--   cond = conditions.hide_in_width,
--   color = { fg = colors.green, gui = 'bold' },
-- }

-- ins_right {
--   'fileformat',
--   fmt = string.upper,
--   icons_enabled = true, -- I think icons are cool but Eviline doesn't have them. sigh
--   color = { fg = colors.red, gui = 'bold' },
-- }


lualine.setup(config)

-- lualine.setup {
-- 	theme = 'auto'
-- }
