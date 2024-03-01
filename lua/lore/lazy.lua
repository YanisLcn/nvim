vim.g.mapleader = ' '
vim.g.localmapleader = ' '

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system {
		'git',
		'clone',
		'--filter=blob:none',
		'https://github/folke/lazy.nvim.git',
		'--branch=stable',
		lazypath,
	}
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
	-- [[ Colorschemes ]]
	
	-- https://github.com/ellisonleao/gruvbox.nvim
	{ "ellisonleao/gruvbox.nvim", priority = 1000, config = true },


	-- [[ Treesitter ]]
	
	-- https://github.com/nvim-treesitter/nvim-treesitter
	{   "nvim-treesitter/nvim-treesitter",
	    build = ":TSUpdate",
	    config = function () 
	      local configs = require("nvim-treesitter.configs")

	      configs.setup({
		  ensure_installed = { "c", "lua", "vim", "vimdoc", "html" },
		  sync_install = false,
		  highlight = { enable = true },
		  indent = { enable = true },  
		})
	    end
	},

	-- [[ Telescope ]]
	
	-- https://github.com/nvim-telescope/telescope.nvim
	{
	    'nvim-telescope/telescope.nvim', tag = '0.1.5',
	      dependencies = { 'nvim-lua/plenary.nvim', 'nvim-tree/nvim-web-devicons' }
	},
}, {})
