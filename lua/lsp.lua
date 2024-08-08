-- https://lsp-zero.netlify.app/v3.x/blog/you-might-not-need-lsp-zero.html
local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
local navic = require("nvim-navic")
local lspconfig = require('lspconfig')

local default_setup = function(server)
  lspconfig[server].setup({
    capabilities = lsp_capabilities,
	 on_attach = function(client, bufnr)
		if client.server_capabilities.documentSymbolProvider then
			navic.attach(client, bufnr)
		end
    end
  })
end

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {},
  handlers = {
    default_setup,
  },
})

local cmp = require('cmp')
local icons = require('config.icons')
local source_names = {
        nvim_lsp = "(LSP)",
        emoji = "(Emoji)",
        path = "(Path)",
        calc = "(Calc)",
        cmp_tabnine = "(Tabnine)",
        vsnip = "(Snippet)",
        luasnip = "(Snippet)",
        buffer = "(Buffer)",
        tmux = "(TMUX)",
        copilot = "(Copilot)",
        treesitter = "(TreeSitter)",
      }

local duplicates = {
        buffer = 1,
        path = 1,
        nvim_lsp = 0,
        luasnip = 1,
      }

cmp.setup({
  sources = {
    {name = 'nvim_lsp'},
  },
  mapping = cmp.mapping.preset.insert({
    ['<CR>'] = cmp.mapping.confirm({select = true}),

	['<C-j>'] = cmp.mapping.scroll_docs(-1),
    ['<C-k>'] = cmp.mapping.scroll_docs(1),

    -- Ctrl + space triggers completion menu
    ['<C-Space>'] = cmp.mapping.complete(),
	['<C-e>'] = cmp.mapping.abort(),
  }),
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
    formatting = {
      fields = { "kind", "abbr", "menu" },
      max_width = 0,
      kind_icons = icons.kind,
      source_names = source_names,
      duplicates = duplicates,
      duplicates_default = 0,
      format = function(entry, vim_item)
        local max_width = 0 --lvim.builtin.cmp.formatting.max_width
        if max_width ~= 0 and #vim_item.abbr > max_width then
          vim_item.abbr = string.sub(vim_item.abbr, 1, max_width - 1) .. icons.ui.Ellipsis
        end

          vim_item.kind = icons.kind[vim_item.kind]

          if entry.source.name == "copilot" then
            vim_item.kind = icons.git.Octoface
            vim_item.kind_hl_group = "CmpItemKindCopilot"
          end

          if entry.source.name == "cmp_tabnine" then
            vim_item.kind = icons.misc.Robot
            vim_item.kind_hl_group = "CmpItemKindTabnine"
          end

          if entry.source.name == "crates" then
            vim_item.kind = icons.misc.Package
            vim_item.kind_hl_group = "CmpItemKindCrate"
          end

          if entry.source.name == "lab.quick_data" then
            vim_item.kind = icons.misc.CircuitBoard
            vim_item.kind_hl_group = "CmpItemKindConstant"
          end

          if entry.source.name == "emoji" then
            vim_item.kind = icons.misc.Smiley
            vim_item.kind_hl_group = "CmpItemKindEmoji"
          end

        vim_item.menu = source_names[entry.source.name]
        vim_item.dup = duplicates[entry.source.name]
          or 0 -- duplicates_default
        return vim_item
      end,
    },
})

-- Add border to lsp window
vim.diagnostic.config({
  float = {
    border = 'rounded',
  },
})

vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
  vim.lsp.handlers.hover,
  {border = 'rounded'}
)

vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
  vim.lsp.handlers.signature_help,
  {border = 'rounded'}
)

-- CUSTOM CONFIG
-- require('mason-lspconfig').setup({
--   ensure_installed = {},
--   handlers = {
--     default_setup,
--     lua_ls = function()
--       lspconfig.lua_ls.setup({
--         capabilities = lsp_capabilities,
--         ---
--         -- This is where you place
--         -- your custom config
--         ---
--       })
--     end,
--   },
-- })
