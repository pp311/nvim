return {
	{
	  'stevearc/oil.nvim',
	  opts = {},
	  -- Optional dependencies
	  -- dependencies = { { "echasnovski/mini.icons", opts = {} } },
	  dependencies = { "nvim-tree/nvim-web-devicons" }, 	
  	},
	{ 
		"catppuccin/nvim", 
		name = "catppuccin", 
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				transparent_background = false,
				no_italic = true,
				flavor = "mocha"
			})
			vim.cmd.colorscheme("catppuccin")
		end,
	},
{
  'nvimdev/dashboard-nvim',
  lazy = false,
  event = 'VimEnter',
  config = function()
	require('dashboard').setup {
	  hide = {
		  statusline,    -- hide statusline default is true
		  tabline,      -- hide the tabline
		  winbar        -- hide winbar
		}
	}
  end,
  dependencies = { {'nvim-tree/nvim-web-devicons'}}
},
    {
        "ggandor/leap.nvim",
        config = function()
            require('leap').add_default_mappings()
            require("leap").setup({
                max_phase_one_targets = nil,
                highlight_unlabeled_phase_one_targets = true,
                max_highlighted_traversal_targets = 10,
                case_sensitive = true,
                special_keys = {
                    repeat_search = '<enter>',
                    next_phase_one_target = '<enter>',
                    next_target = { '<enter>', ';' },
                    prev_target = { '<tab>', ',' },
                    next_group = '<space>',
                    prev_group = '<tab>',
                    multi_accept = '<enter>',
                    multi_revert = '<backspace>',
                }
            })
        end
    },
	{
		'nvim-lualine/lualine.nvim',
		config = function()
			require("lualine").setup({
				options = {
					icons_enabled = true,

				},
				sections = {
					lualine_a = {'mode'},
					lualine_b = {'branch', 'diff', 'diagnostics'},
					lualine_c = {'filename'},
					lualine_x = {'filetype'},
					lualine_y = {'progress'},
					lualine_z = {'location'}
				  },
				  inactive_sections = {
					lualine_a = {},
					lualine_b = {},
					lualine_c = {'filename'},
					lualine_x = {'location'},
					lualine_y = {},
					lualine_z = {}
				  },
			})
		end,
		dependencies = { 'nvim-tree/nvim-web-devicons' }
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
			config = function () 
			  local configs = require("nvim-treesitter.configs")

			  configs.setup({
				  ensure_installed = { "c_sharp", "lua", "javascript", "html" },
				  sync_install = false,
				  highlight = { enable = true },
				  indent = { enable = true },  
				})
			end,
	},
	{
	  "folke/which-key.nvim",
	  event = "VeryLazy",
	  opts = {
		plugins = {
			registers = true	
		}
	  },
	  keys = {
	    {
	      "<leader>f",
	      function()
			require("which-key").show({ global = false })
	      end,
	      desc = "Telescope",
	    },
	    {
	      "<leader>g",
	      function()
			require("which-key").show({ global = false })
	      end,
	      desc = "Git",
	    },
	  },
	},
	{
    	'nvim-telescope/telescope.nvim', tag = '0.1.8', -- or branch = '0.1.x',
		lazy = true,
      	dependencies = { 'nvim-lua/plenary.nvim' }
    },
    {
        "APZelos/blamer.nvim",
    },
	{
		"williamboman/mason.nvim",
	},
	{
		"williamboman/mason-lspconfig.nvim",
	},
	{
		"neovim/nvim-lspconfig",
	},
	{
		"hrsh7th/nvim-cmp"
	},
	{
		"hrsh7th/cmp-nvim-lsp"
	},
	{
		"L3MON4D3/LuaSnip"
	},
	{
		'windwp/nvim-autopairs',
		event = "InsertEnter",
		config = true
	},
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require('colorizer').setup({
				'*';
			})
		end
	},
	{
		"SmiteshP/nvim-navic",
      	dependencies = { "neovim/nvim-lspconfig" },
		config = function()
			local icons = require("config.icons")
			require("nvim-navic").setup({
				icons = icons.kind,
				lsp = {
					auto_attach = true,
					preference = nil
				},
				highlight = false,
				separator = " > ",
				depth_limit = 0,
				depth_limit_indicator = "..",
				safe_output = true,
				lazy_update_context = false,
				click = false,
				format_text = function(text)
					return text
				end,
		})
		end
	}
}
