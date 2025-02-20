return {
    -- {
    -- 	'stevearc/oil.nvim',
    -- 	opts = {},
    -- 	-- Optional dependencies
    -- 	-- dependencies = { { "echasnovski/mini.icons", opts = {} } },
    -- 	dependencies = { "nvim-tree/nvim-web-devicons" },
    -- 	config = function()
    -- 		require("oil").setup({
    -- 			columns = {
    -- 				"icon",
    -- 				"permissions",
    -- 				"size",
    -- 				"mtime",
    -- 			},
    -- 			buf_options = {
    -- 				buflisted = false,
    -- 				bufhidden = "hide",
    -- 			},
    -- 		})
    -- 	end
    -- },
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        lazy = false,
        config = function()
            require("catppuccin").setup({
                transparent_background = true,
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
                    statusline, -- hide statusline default is true
                    tabline,    -- hide the tabline
                    winbar      -- hide winbar
                }
            }
        end,
        dependencies = { { 'nvim-tree/nvim-web-devicons' } }
    },
    {
        "ggandor/leap.nvim",
        event = "User FileOpened",
        lazy = false,
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
        lazy = false,
        event = 'VimEnter',
        config = function()
            require("lualine").setup({
                options = {
                    icons_enabled = true,

                },
                sections = {
                    lualine_a = { 'mode' },
                    lualine_b = { 'branch', 'diff', 'diagnostics' },
                    lualine_c = { 'filename' },
                    lualine_x = { 'filetype' },
                    lualine_y = { 'progress' },
                    lualine_z = { 'location' }
                },
                inactive_sections = {
                    lualine_a = {},
                    lualine_b = {},
                    lualine_c = { 'filename' },
                    lualine_x = { 'location' },
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
        config = function()
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
        lazy = true,
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
            {
                "<leader>t",
                function()
                    require("which-key").show({ global = false })
                end,
                desc = "Buffer",
            },
            {
                "<leader>c",
                function()
                    require("which-key").show({ global = false })
                end,
                desc = "Code",
            }
        },
        layout = {
            width = { min = 20 }, -- min and max width of the columns
            spacing = 3,          -- spacing between columns
        },
        win = {
            no_overlap = true, -- don't allow the popup to overlap with the cursor
            width = 1,
            height = { min = 4, max = 25 },
            -- col = 0,
            -- row = math.huge,
            border = "double",
            padding = { 1, 2 }, -- extra window padding [top/bottom, right/left]
            title = true,
            title_pos = "center",
            zindex = 1000,
            -- Additional vim.wo and vim.bo options
            bo = {},
            wo = {
                winblend = 10, -- value between 0-100 0 for fully opaque and 100 for fully transparent
            },
        },
    },
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.8', -- or branch = '0.1.x',
        lazy = true,
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    {
        "APZelos/blamer.nvim",
        lazy = true,
        event = "User FileOpened",
    },
    {
        "williamboman/mason.nvim",
        lazy = true,
        event = "User FileOpened",
    },
    {
        "williamboman/mason-lspconfig.nvim",
        lazy = true,
        event = "User FileOpened",
    },
    {
        "neovim/nvim-lspconfig",
    },
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter"
    },
    {
        "hrsh7th/cmp-nvim-lsp"
    },
    {
        "L3MON4D3/LuaSnip",
        event = "InsertEnter",
        lazy = true
    },
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true
    },
    {
        "norcalli/nvim-colorizer.lua",
        lazy = true,
        event = "User FileOpened",
        config = function()
            require('colorizer').setup({
                '*',
            })
        end
    },
    {
        "lewis6991/gitsigns.nvim",
        event = "User FileOpened",
        lazy = false,
        config = function()
            require('gitsigns').setup()
        end
    },
    {
        'akinsho/bufferline.nvim',
        version = "*",
        lazy = false,
        dependencies = 'nvim-tree/nvim-web-devicons',
        config = function()
            require('bufferline').setup()
        end
    },
    {
        "rcarriga/nvim-notify",
        config = function()
            require("notify").setup {
                stages = 'fade_in_slide_out',
                background_colour = 'FloatShadow',
                timeout = 3000,
                icons = {
                    ERROR = "",
                    WARN = "",
                    INFO = "",
                    DEBUG = "",
                    TRACE = "✎",
                },
            }
            vim.notify = require('notify')
        end
    },
    {
        "voldikss/vim-floaterm"
    },
    {
        "mikavilpas/yazi.nvim",
        event = "VeryLazy",
        keys = {
            -- 👇 in this section, choose your own keymappings!
            {
                "<leader>e",
                mode = { "n", "v" },
                "<cmd>Yazi<cr>",
                desc = "Yazi",
            },
            {
                -- Open in the current working directory
                "<leader>cw",
                "<cmd>Yazi cwd<cr>",
                desc = "File manager in working directory",
            },
            {
                "<c-up>",
                "<cmd>Yazi toggle<cr>",
                desc = "Resume yazi session",
            },
        },
        ---@type YaziConfig | {}
        opts = {
            -- if you want to open yazi instead of netrw, see below for more info
            open_for_directories = true,
            keymaps = {
                show_help = "<f1>",
            },
        },
    },
    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "InsertEnter",
        config = function()
            require('copilot').setup({
                panel = {
                    enabled = true,
                    auto_refresh = true,
                    keymap = {
                        jump_prev = "[[",
                        jump_next = "]]",
                        accept = "<CR>",
                        refresh = "gr",
                        open = "<M-CR>"
                    },
                    layout = {
                        position = "right", -- | top | left | right | horizontal | vertical
                        ratio = 0.3
                    },
                },
                suggestion = {
                    enabled = true,
                    auto_trigger = true,
                    hide_during_completion = true,
                    debounce = 75,
                    keymap = {
                        accept = "<M-l>",
                        accept_word = false,
                        accept_line = false,
                        next = "<M-]>",
                        prev = "<M-[>",
                        dismiss = "<C-]>",
                    },
                },
                filetypes = {
                    yaml = false,
                    markdown = false,
                    help = false,
                    gitcommit = false,
                    gitrebase = false,
                    hgcommit = false,
                    svn = false,
                    cvs = false,
                    ["*"] = true,
                },
                copilot_node_command = 'node', -- Node.js version must be > 18.x
                server_opts_overrides = {},
            })
        end,
    },
    {
        'stevearc/conform.nvim',
        opts = {},
        config = function()
            require("conform").setup({
                formatters_by_ft = {
                    lua = { "stylua" },
                    -- Conform will run multiple formatters sequentially
                    python = { "isort", "black" },
                    -- You can customize some of the format options for the filetype (:help conform.format)
                    rust = { "rustfmt", lsp_format = "fallback" },
                    -- Conform will run the first available formatter
                    javascript = { "prettierd", "prettier", stop_after_first = true },
                },
            })
        end
    },
    {
        "utilyre/barbecue.nvim",
        name = "barbecue",
        version = "*",
        dependencies = {
            "SmiteshP/nvim-navic",
            "nvim-tree/nvim-web-devicons", -- optional dependency
        },
        opts = {
            -- configurations go here
        },
    }
}
