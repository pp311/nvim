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
        "APZelos/blamer.nvim",
    },
}
