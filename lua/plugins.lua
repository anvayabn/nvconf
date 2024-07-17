-- lazy nvim 
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	
	-- moonfly colorscheme
	{
	  "bluz71/vim-moonfly-colors",
	  name = "moonfly", 
	  lazy = false,
	  priority = 1000 ,
	},
        {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' }
        },
	-- Vscode-like pictograms
	{
		"onsails/lspkind.nvim",
		event = { "VimEnter" },
	},
	-- Auto-completion engine
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"lspkind.nvim",
			"hrsh7th/cmp-nvim-lsp", -- lsp auto-completion
			"hrsh7th/cmp-buffer", -- buffer auto-completion
			"hrsh7th/cmp-path", -- path auto-completion
			"hrsh7th/cmp-cmdline", -- cmdline auto-completion
		},
		config = function()
			require("config.nvim-cmp")
		end,
	},
	-- Code snippet engine
	{
		"L3MON4D3/LuaSnip",
		version = "v2.*",
	},
	-- LSP manager
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"neovim/nvim-lspconfig",

    {
        "nvim-telescope/telescope-file-browser.nvim",
        dependencies = { 
            "nvim-telescope/telescope.nvim", 
            "nvim-lua/plenary.nvim" 
        }
    },
    {
	    'windwp/nvim-autopairs',
	    event = "InsertEnter",
	    config = true
	    -- use opts = {} for passing setup options
	    -- this is equalent to setup({}) function
    },
    {
      "nvim-tree/nvim-tree.lua",
      version = "*",
      lazy = false,
      dependencies = {
        "nvim-tree/nvim-web-devicons",
      },
      config = function()
        require("nvim-tree").setup {}
      end,
    }, 
--     {
--         'akinsho/bufferline.nvim', 
--         version = "*", 
--         dependencies = 'nvim-tree/nvim-web-devicons'
--     },
})

require('lualine').setup({
    options = { 
        theme = 'moonfly'
    }
})


require('mason').setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

require('mason-lspconfig').setup({
    -- A list of servers to automatically install if they're not already installed
    ensure_installed = { 'pyright', 'lua_ls', 'yamlls', 'bashls' },
})

require('telescope').setup {}
require("telescope").load_extension "file_browser"

-- bufferline setup
-- vim.opt.termguicolors = true
-- require("bufferline").setup{}
