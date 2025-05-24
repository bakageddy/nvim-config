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
			"nvim-tree/nvim-tree.lua",
			requires = {
				"nvim-tree/nvim-web-devicons",
			},
			tag = "nightly",
		}

		-- LSP Zero
		use {
			'VonHeikemen/lsp-zero.nvim',
			branch = 'v1.x',
			requires = {
				-- LSP Support
				{ 'neovim/nvim-lspconfig' },
				{ 'williamboman/mason.nvim' },
				{ 'williamboman/mason-lspconfig.nvim' },

				-- Autocompletion
				{ 'hrsh7th/nvim-cmp' },
				{ 'hrsh7th/cmp-nvim-lsp' },
				{ 'hrsh7th/cmp-buffer' },
				{ 'hrsh7th/cmp-path' },
				{ 'saadparwaiz1/cmp_luasnip' },
				{ 'hrsh7th/cmp-nvim-lua' },

				-- Snippets
				{ 'L3MON4D3/LuaSnip' },
				{ 'rafamadriz/friendly-snippets' },
			}
		}

		use {
			"jay-babu/mason-null-ls.nvim",
			requires = {
				"williamboman/mason.nvim",
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
		use 'alexxgmz/e-ink.nvim'
	end)
