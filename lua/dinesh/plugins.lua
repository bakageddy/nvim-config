vim.cmd [[ packadd packer.nvim ]]

return require('packer').startup(

	function(use)
		use 'wbthomason/packer.nvim'

		-- Telescope
		use {
			'nvim-telescope/telescope.nvim',
			tag = '0.1.1',
			requires = {
				{ 'nvim-lua/plenary.nvim' }
			},
		}

		-- Terminal
		use 'numToStr/FTerm.nvim'

		-- Treesitter
		use {
			'nvim-treesitter/nvim-treesitter',
			run = ":TSUpdate",
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
				"jose-elias-alvarez/null-ls.nvim",
			}
		}

		-- Impatient
		use 'lewis6991/impatient.nvim'

		-- for Yuck!
		use 'gpanders/nvim-parinfer'

		-- Status Line
		use 'nvim-lualine/lualine.nvim'

		-- Colorizer
		use 'norcalli/nvim-colorizer.lua'

		-- Colorscheme
		use 'ellisonleao/gruvbox.nvim'
		use 'rebelot/kanagawa.nvim'
		use 'alexvzyl/nordic.nvim'
		use 'maxmx03/solarized.nvim'
	end)
