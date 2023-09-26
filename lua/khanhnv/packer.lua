---@diagnostic disable: undefined-global
local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
---@diagnostic disable-next-line: missing-parameter
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

return packer.startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.0',
		requires = {{ 'nvim-lua/plenary.nvim' }}
	}

  use { "windwp/nvim-autopairs" }
  -- Comment
  use "numToStr/Comment.nvim"
  use "folke/todo-comments.nvim"
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional
    },
  }
  use "akinsho/bufferline.nvim"
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }
  use { "goolord/alpha-nvim" }
  use {"folke/which-key.nvim"}

	use 'NvChad/nvim-colorizer.lua'
	use 'lunarvim/darkplus.nvim'
	use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
	use 'nvim-treesitter/playground'
	use 'theprimeagen/harpoon'
	use 'mbbill/undotree'
	use 'tpope/vim-fugitive'
  use "hrsh7th/nvim-cmp" -- The completion plugin
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-path"
	use "saadparwaiz1/cmp_luasnip"
	use "hrsh7th/cmp-nvim-lsp"
	use "hrsh7th/cmp-nvim-lua"
	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v2.x',
		requires = {
			-- LSP Support
			{'neovim/nvim-lspconfig'},
			{'williamboman/mason.nvim'},
			{'williamboman/mason-lspconfig.nvim'},

			-- Autocompletion
			{'hrsh7th/nvim-cmp'},
			{'hrsh7th/cmp-nvim-lsp'},
			{'L3MON4D3/LuaSnip'},

			-- Snippets
			{'L3MON4D3/LuaSnip'},
			{'rafamadriz/friendly-snippets'},
		}
	}

  use {
    'tzachar/cmp-tabnine',
    run = './install.sh',
    requires= {
      'hrsh7th/nvim-cmp'
    }
  }
  use("petertriho/nvim-scrollbar")
  use "lvimuser/lsp-inlayhints.nvim"


end)
