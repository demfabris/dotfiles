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

		-- Rust
		use 'simrat39/rust-tools.nvim'
    use 'rust-lang/rust.vim'

		-- Typescript
		use 'jose-elias-alvarez/nvim-lsp-ts-utils'

		-- Lsp
		use 'neovim/nvim-lspconfig'
		use 'williamboman/nvim-lsp-installer'
		use 'nvim-lua/lsp-status.nvim'
		use 'nvim-lua/plenary.nvim'
		use 'ray-x/lsp_signature.nvim'
  	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
		use 'folke/lsp-colors.nvim'
		use {
				'saecki/crates.nvim',
				tag = 'v0.1.0',
				requires = { 'nvim-lua/plenary.nvim' },
		}

		-- Completer
		use { 'ms-jpq/coq_nvim', branch = 'coq' }
		use { 'ms-jpq/coq.artifacts', branch = 'artifacts' }

		use 'Shatur/neovim-ayu'
  	use 'numToStr/Comment.nvim' -- Comment with 'gc'
		use 'windwp/nvim-autopairs'

		-- UI
		use { 'romgrk/barbar.nvim', requires = 'kyazdani42/nvim-web-devicons' } -- tabline
		use { 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true } }
		use 'arkav/lualine-lsp-progress'
		use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } }
		use 'akinsho/toggleterm.nvim' -- better terminal

		use {
      'folke/which-key.nvim',
      config = function() require('which-key').setup() end
    }

		use { 'ms-jpq/chadtree', branch = 'chad', run = 'python3 -m chadtree deps' }
		use {
				'nvim-telescope/telescope.nvim',
				requires = {
						'nvim-lua/plenary.nvim',
						'kyazdani42/nvim-web-devicons',
						'gbrlsnchs/telescope-lsp-handlers.nvim',
						'nvim-telescope/telescope-live-grep-raw.nvim',
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
     ensure_installed = 'maintained', -- one of 'all', 'maintained' (parsers with maintainers)
     highlight = {
         enable = false,
         additional_vim_regex_highlighting = false,
     },
 })
