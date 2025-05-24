require 'nvim-treesitter.configs'.setup {
	ensure_installed = { "rust", "go", "vim", "c" },
	sync_install = false,
	auto_install = true,

	highlight = {
		enable = true,
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = '<c-space>',
			node_incremental = '<c-space>',
			scope_incremental = '<c-s>',
			node_decremental = '<M-space>',
		},
	},
	textobjects = {
		select = {
			enable = true,
			lookahead = true,
			keymaps = {
				['aa'] = '@parameter.outer',
				['ia'] = '@parameter.inner',
				['af'] = '@function.outer',
				['if'] = '@function.inner',
				['ac'] = '@class.outer',
				['ic'] = '@class.inner',
			},
		},

		move = {
			enable = true,
			set_jumps = true,
			goto_next_start = {
				[']m'] = "@function.outer",
				[']]'] = "@class.outer",
			},
			goto_next_end = {
				[']M'] = "@function.outer",
				[']['] = "@class.outer",
			},
			goto_previous_start = {
				['[m'] = "@function.outer",
				['[['] = "@class.outer",
			},

			goto_previous_end = {
				['[M'] = "@function.outer",
				['[]'] = "@class.outer",
			},
		}
	}
}

vim.keymap.set("n", "<leader>tt", "<CMD>TSBufToggle highlight<CR>", { silent = true })
vim.keymap.set("n", "<leader>tu", "<CMD>TSCaptureUnderCursor<CR>", { silent = true })
