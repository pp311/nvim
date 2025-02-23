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
            local is_transparent = true
            if vim.g.neovide then
                is_transparent = false
            end

            require("catppuccin").setup({
                transparent_background = is_transparent,
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
        -- Delay before showing the popup. Can be a number or a function that returns a number.
        ---@type number | fun(ctx: { keys: string, mode: string, plugin?: string }):number
        -- delay = function(ctx)
        --     return ctx.plugin and 0 or 200
        -- end,
        delay = 0,
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
            },
            {
                "<leader>x",
                function()
                    require("which-key").show({ global = false })
                end,
                desc = "Trouble",
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
                        accept = "<C-l>",
                        accept_word = false,
                        accept_line = false,
                        next = "<M-]>",
                        prev = "<M-[>",
                        dismiss = "<M-\\>",
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
            include_buftypes = { "" },
            exclude_filetypes = {
                "netrw",
                "toggleterm",
                "terminal",
                "git",
                "markdown",
            },
            -- configurations go here
        },
    },
    {
        "folke/trouble.nvim",
        opts = {}, -- for default options, refer to the configuration section for custom setup.
        cmd = "Trouble",
        keys = {
            {
                "<leader>xx",
                "<cmd>Trouble diagnostics toggle<cr>",
                desc = "Diagnostics (Trouble)",
            },
            {
                "<leader>xb",
                "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
                desc = "Buffer Diagnostics (Trouble)",
            },
            {
                "<leader>xs",
                "<cmd>Trouble symbols toggle focus=false<cr>",
                desc = "Symbols (Trouble)",
            },
            {
                "<leader>xd",
                "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
                desc = "LSP Definitions / references / ... (Trouble)",
            },
            {
                "<leader>xl",
                "<cmd>Trouble loclist toggle<cr>",
                desc = "Location List (Trouble)",
            },
            {
                "<leader>xq",
                "<cmd>Trouble qflist toggle<cr>",
                desc = "Quickfix List (Trouble)",
            },
        },
    },
    {
        "RRethy/vim-illuminate",
        config = function()
            require('illuminate').configure({
                -- providers: provider used to get references in the buffer, ordered by priority
                providers = {
                    'lsp',
                    'treesitter',
                    'regex',
                },
                -- delay: delay in milliseconds
                delay = 50,
                -- filetype_overrides: filetype specific overrides.
                -- The keys are strings to represent the filetype while the values are tables that
                -- supports the same keys passed to .configure except for filetypes_denylist and filetypes_allowlist
                filetype_overrides = {},
                -- filetypes_denylist: filetypes to not illuminate, this overrides filetypes_allowlist
                filetypes_denylist = {
                    'dirbuf',
                    'dirvish',
                    'fugitive',
                },
                -- filetypes_allowlist: filetypes to illuminate, this is overridden by filetypes_denylist
                -- You must set filetypes_denylist = {} to override the defaults to allow filetypes_allowlist to take effect
                filetypes_allowlist = {},
                -- modes_denylist: modes to not illuminate, this overrides modes_allowlist
                -- See `:help mode()` for possible values
                modes_denylist = {},
                -- modes_allowlist: modes to illuminate, this is overridden by modes_denylist
                -- See `:help mode()` for possible values
                modes_allowlist = {},
                -- providers_regex_syntax_denylist: syntax to not illuminate, this overrides providers_regex_syntax_allowlist
                -- Only applies to the 'regex' provider
                -- Use :echom synIDattr(synIDtrans(synID(line('.'), col('.'), 1)), 'name')
                providers_regex_syntax_denylist = {},
                -- providers_regex_syntax_allowlist: syntax to illuminate, this is overridden by providers_regex_syntax_denylist
                -- Only applies to the 'regex' provider
                -- Use :echom synIDattr(synIDtrans(synID(line('.'), col('.'), 1)), 'name')
                providers_regex_syntax_allowlist = {},
                -- under_cursor: whether or not to illuminate under the cursor
                under_cursor = true,
                -- large_file_cutoff: number of lines at which to use large_file_config
                -- The `under_cursor` option is disabled when this cutoff is hit
                large_file_cutoff = 10000,
                -- large_file_config: config to use for large files (based on large_file_cutoff).
                -- Supports the same keys passed to .configure
                -- If nil, vim-illuminate will be disabled for large files.
                large_file_overrides = nil,
                -- min_count_to_highlight: minimum number of matches required to perform highlighting
                min_count_to_highlight = 1,
                -- should_enable: a callback that overrides all other settings to
                -- enable/disable illumination. This will be called a lot so don't do
                -- anything expensive in it.
                -- should_enable = function(bufnr) return true end,
                --
                -- case_insensitive_regex: sets regex case sensitivity
                case_insensitive_regex = false,
                -- disable_keymaps: disable default keymaps
                disable_keymaps = false,
            })
        end
    },
    {
        "rachartier/tiny-inline-diagnostic.nvim",
        event = "VeryLazy", -- Or `LspAttach`
        priority = 1000,    -- needs to be loaded in first
        config = function()
            require('tiny-inline-diagnostic').setup({
                preset = "powerline",
                transparent_background = false,

                hi = {
                    error = "DiagnosticError", -- Highlight group for error messages
                    warn = "DiagnosticWarn",   -- Highlight group for warning messages
                    info = "DiagnosticInfo",   -- Highlight group for informational messages
                    hint = "DiagnosticHint",   -- Highlight group for hint or suggestion messages
                    arrow = "NonText",         -- Highlight group for diagnostic arrows

                    -- Background color for diagnostics
                    -- Can be a highlight group or a hexadecimal color (#RRGGBB)
                    background = "CursorLine",

                    -- Color blending option for the diagnostic background
                    -- Use "None" or a hexadecimal color (#RRGGBB) to blend with another color
                    mixing_color = "None",
                },

                options = {
                    -- Display the source of the diagnostic (e.g., basedpyright, vsserver, lua_ls etc.)
                    show_source = false,

                    -- Use icons defined in the diagnostic configuration
                    use_icons_from_diagnostic = false,

                    -- Set the arrow icon to the same color as the first diagnostic severity
                    set_arrow_to_diag_color = false,

                    -- Add messages to diagnostics when multiline diagnostics are enabled
                    -- If set to false, only signs will be displayed
                    add_messages = true,

                    -- Time (in milliseconds) to throttle updates while moving the cursor
                    -- Increase this value for better performance if your computer is slow
                    -- or set to 0 for immediate updates and better visual
                    throttle = 20,

                    -- Minimum message length before wrapping to a new line
                    softwrap = 30,

                    -- Configuration for multiline diagnostics
                    -- Can either be a boolean or a table with the following options:
                    --  multilines = {
                    --      enabled = false,
                    --      always_show = false,
                    -- }
                    -- If it set as true, it will enable the feature with this options:
                    --  multilines = {
                    --      enabled = true,
                    --      always_show = false,
                    -- }
                    multilines = {
                        -- Enable multiline diagnostic messages
                        enabled = false,

                        -- Always show messages on all lines for multiline diagnostics
                        always_show = false,
                    },

                    -- Display all diagnostic messages on the cursor line
                    show_all_diags_on_cursorline = false,

                    -- Enable diagnostics in Insert mode
                    -- If enabled, it is better to set the `throttle` option to 0 to avoid visual artifacts
                    enable_on_insert = false,

                    -- Enable diagnostics in Select mode (e.g when auto inserting with Blink)
                    enable_on_select = false,

                    overflow = {
                        -- Manage how diagnostic messages handle overflow
                        -- Options:
                        -- "wrap" - Split long messages into multiple lines
                        -- "none" - Do not truncate messages
                        -- "oneline" - Keep the message on a single line, even if it's long
                        mode = "wrap",

                        -- Trigger wrapping to occur this many characters earlier when mode == "wrap".
                        -- Increase this value appropriately if you notice that the last few characters
                        -- of wrapped diagnostics are sometimes obscured.
                        padding = 0,
                    },

                    -- Configuration for breaking long messages into separate lines
                    break_line = {
                        -- Enable the feature to break messages after a specific length
                        enabled = false,

                        -- Number of characters after which to break the line
                        after = 30,
                    },

                    -- Custom format function for diagnostic messages
                    -- Example:
                    -- format = function(diagnostic)
                    --     return diagnostic.message .. " [" .. diagnostic.source .. "]"
                    -- end
                    format = nil,


                    virt_texts = {
                        -- Priority for virtual text display
                        priority = 2048,
                    },

                    -- Filter diagnostics by severity
                    -- Available severities:
                    -- vim.diagnostic.severity.ERROR
                    -- vim.diagnostic.severity.WARN
                    -- vim.diagnostic.severity.INFO
                    -- vim.diagnostic.severity.HINT
                    severity = {
                        vim.diagnostic.severity.ERROR,
                        vim.diagnostic.severity.WARN,
                        vim.diagnostic.severity.INFO,
                        vim.diagnostic.severity.HINT,
                    },

                    -- Events to attach diagnostics to buffers
                    -- You should not change this unless the plugin does not work with your configuration
                    overwrite_events = nil,
                },
                disabled_ft = {}                            -- List of filetypes to disable the plugin
            })
            vim.diagnostic.config({ virtual_text = false }) -- Only if needed in your configuration, if you already have native LSP diagnostics
        end
    },
    {
        'sethen/line-number-change-mode.nvim',
        config = function()
            require('catppuccin').setup({
                flavour = 'mocha',
            });
            local palette = require('catppuccin.palettes').get_palette('mocha')

            if (palette == nil) then
                return nil
            end

            require("line-number-change-mode").setup({
                mode = {
                    i = {
                        bg = palette.green,
                        fg = palette.mantle,
                        bold = true,
                    },
                    n = {
                        bg = palette.blue,
                        fg = palette.mantle,
                        bold = true,
                    },
                    R = {
                        bg = palette.maroon,
                        fg = palette.mantle,
                        bold = true,
                    },
                    v = {
                        bg = palette.mauve,
                        fg = palette.mantle,
                        bold = true,
                    },
                    V = {
                        bg = palette.mauve,
                        fg = palette.mantle,
                        bold = true,
                    },
                }
            })
        end
    }
}
