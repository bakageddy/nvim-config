vim.cmd [[ packadd packer.nvim ]]

return require('packer').startup(

	function(use)
		use 'wbthomason/packer.nvim'

		-- Git
		use {
			"tpope/vim-fugitive"
		}

		use 'lewis6991/gitsigns.nvim'

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
				"nvim-lua/plenary.nvim",
			},
			after = {
				"telescope.nvim"
			}
		}

		-- Terminal
		use 'akinsho/toggleterm.nvim'

		-- Treesitter
		use {
			'nvim-treesitter/nvim-treesitter',
			run = ":TSUpdate",
		}

		use {
			'nvim-treesitter/nvim-treesitter-textobjects',
			after = 'nvim-treesitter',
			requires = 'nvim-treesitter/nvim-treesitter',
		}

		use {
			'nvim-treesitter/playground',
			after = 'nvim-treesitter',
			requires = 'nvim-treesitter/nvim-treesitter',
		}

		use "windwp/nvim-autopairs"
		use "numToStr/Comment.nvim"

		-- Neovim tree
		use {
			"nvim-neo-tree/neo-tree.nvim",
			branch = "v3.x",
			requires = {
				"nvim-lua/plenary.nvim",
				"nvim-tree/nvim-web-devicons",
				"MunifTanjim/nui.nvim"
			},
		}

		-- LSP Zero
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

		-- Misc
		use 'folke/todo-comments.nvim'

		-- Colorscheme
		use 'ellisonleao/gruvbox.nvim'
		use 'miikanissi/modus-themes.nvim'
		use 'rebelot/kanagawa.nvim'
		use 'webhooked/kanso.nvim'
	end)
