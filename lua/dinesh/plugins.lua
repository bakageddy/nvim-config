---@diagnostic disable: unknown-cast-variable
vim.cmd [[ packadd packer.nvim ]]

-- TODO: Refactor to lazy.nvim
return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'

	-- Tmux
	use 'tmux-plugins/vim-tmux'
	use 'jedrzejboczar/possession.nvim'

	-- Git
	use {
		'NeogitOrg/neogit',
		requires = {
			'nvim-lua/plenary.nvim',
			'sindrets/diffview.nvim'
		}
	}

	use 'lewis6991/gitsigns.nvim'

	use 'folke/todo-comments.nvim'

	-- Telescope
	use {
		'nvim-telescope/telescope.nvim',
		requires = {
			{ 'nvim-lua/plenary.nvim' },
			{
				'nvim-telescope/telescope-fzf-native.nvim',
				run = 'make',
			},
		},
	}

	use {
		"nvim-telescope/telescope-file-browser.nvim",
		requires = {
			"nvim-telescope/telescope.nvim",
			"nvim-lua/plenary.nvim"
		},
		after = {
			"telescope.nvim"
		}
	}

	-- Terminal
	use 'akinsho/toggleterm.nvim'
	use 'pocco81/true-zen.nvim'

	-- Treesitter
	use {
		'nvim-treesitter/nvim-treesitter',
		run = ":TSUpdate",
	}

	use {
		'nvim-treesitter/nvim-treesitter-context',
		after = "nvim-treesitter",
		requires = "nvim-treesitter/nvim-treesitter"
	}

	use {
		"nvim-treesitter/nvim-treesitter-textobjects",
		after = "nvim-treesitter",
		requires = "nvim-treesitter/nvim-treesitter",
	}

	use {
		"nvim-treesitter/playground",
		after = "nvim-treesitter",
	}

	use {
		"windwp/nvim-autopairs",
		after = "nvim-treesitter",
	}

	use {
		"numToStr/Comment.nvim",
		after = "nvim-treesitter",
	}

	-- Neovim tree
	use {
		"nvim-tree/nvim-tree.lua",
		requires = {
			"nvim-tree/nvim-web-devicons",
		},
	}
	-- LSP Support
	use { 'neovim/nvim-lspconfig' }
	use { 'mason-org/mason.nvim' }
	use { 'mason-org/mason-lspconfig.nvim' }
	use { 'folke/neodev.nvim' }

	-- Autocompletion
	use { 'saghen/blink.cmp' }

	-- Snippets
	use { 'L3MON4D3/LuaSnip' }
	use { 'rafamadriz/friendly-snippets' }

	use {
		"mfussenegger/nvim-dap",
		requires = {
			{'rcarriga/nvim-dap-ui'},
			{'nvim-neotest/nvim-nio'},
			{'williamboman/mason.nvim'},
			{'jay-babu/mason-nvim-dap.nvim'},
		}
	}
	use {
		'mfussenegger/nvim-jdtls'
	}

	use {
		"nvimtools/none-ls.nvim"
	}

	use "stevearc/conform.nvim"

	use {
		'nvimdev/indentmini.nvim',
	}

	use {
		"jay-babu/mason-null-ls.nvim",
		requires = {
			"mason-org/mason.nvim",
			"nvimtools/none-ls.nvim",
		}
	}

	-- Impatient
	use 'lewis6991/impatient.nvim'

	-- Status Line
	use 'nvim-lualine/lualine.nvim'

	-- Colorizer
	use 'norcalli/nvim-colorizer.lua'

	-- Colorscheme
	use 'ellisonleao/gruvbox.nvim'
	use 'miikanissi/modus-themes.nvim'
	use 'rebelot/kanagawa.nvim'
	use 'bakageddy/alduin.nvim'
	use 'projekt0n/github-nvim-theme'
end)
