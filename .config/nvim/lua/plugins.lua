use = use
Vim = vim

require('packer').startup({function()
		use 'wbthomason/packer.nvim'

		-- speedup lua module load time
		use 'lewis6991/impatient.nvim'
		use { 'nathom/filetype.nvim',
					config = function()
						require('filetype').setup({})
					end
		}

		use 'simrat39/rust-tools.nvim'

		-- Lsp
		use 'neovim/nvim-lspconfig'
		use 'williamboman/nvim-lsp-installer'
		use 'nvim-lua/lsp-status.nvim'
		use 'nvim-lua/plenary.nvim'
		use 'ray-x/lsp_signature.nvim'
  	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
		use 'jose-elias-alvarez/nvim-lsp-ts-utils'
		use {
				'saecki/crates.nvim',
				tag = 'v0.1.0',
				requires = { 'nvim-lua/plenary.nvim' },
		}

		-- Completer
		use { 'ms-jpq/coq_nvim', branch = 'coq' }
		use { 'ms-jpq/coq.artifacts', branch = 'artifacts' }
		use { 'ms-jpq/coq.thirdparty', branch = '3p' }

		use 'Shatur/neovim-ayu'
		use { 'numToStr/Comment.nvim',
					config = function()
						require('Comment').setup()
					end
				} -- Comment with 'gc'
		use 'windwp/nvim-autopairs'

		-- UI
		use { 'romgrk/barbar.nvim', requires = 'kyazdani42/nvim-web-devicons' } -- tabline
		use { 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true } }
		use 'arkav/lualine-lsp-progress'
		use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } }
		use 'lukas-reineke/indent-blankline.nvim'

		use {
			"luukvbaal/stabilize.nvim",
			config = function() require("stabilize").setup() end
		}

		use {
				'folke/which-key.nvim',
				config = function()
					require('which-key').setup()
				end
		}

		use { 'ms-jpq/chadtree', branch = 'chad', run = 'python3 -m chadtree deps' }
		use 'rmagatti/auto-session' -- Session management
		use {
				'nvim-telescope/telescope.nvim',
				requires = {
						'nvim-lua/plenary.nvim',
						'kyazdani42/nvim-web-devicons',
						'gbrlsnchs/telescope-lsp-handlers.nvim',
						'nvim-telescope/telescope-live-grep-raw.nvim',
						{ 'rmagatti/session-lens', requires = { 'rmagatti/auto-session' } },
						{ 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
				},
    }
end,
  config = {
    -- Move to lua dir so impatient.nvim can cache it
    compile_path = Vim.fn.stdpath('config')..'/lua/packer_compiled.lua'
  }
})

require('nvim-treesitter.configs').setup({
    ensure_installed = 'maintained', -- one of 'all', 'maintained' (parsers with maintainers), or a list of languages
    highlight = {
        enable = true,
    },
    indent = {
        enable = true,
    },
    matchup = {
        enable = true,
    },
    textobjects = {
        select = {
            keymaps = {
                ['uc'] = '@comment.outer',
            },
        },
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = '<CR>',
            scope_incremental = '<CR>',
            node_incremental = '<TAB>',
            node_decremental = '<S-TAB>',
        },
    },
})

require('ayu').setup({})

require('rust-tools').setup()
