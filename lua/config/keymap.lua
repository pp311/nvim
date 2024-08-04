local k = vim.keymap
local builtin = require("telescope.builtin")

k.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
k.set("n", "<leader>e", ":vsplit<CR><C-w>w<CMD>Oil<CR>", { desc = "File explorer" })

k.set({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })
k.set({ "n" }, "<leader>q", "<cmd>q<cr><esc>", { desc = "Quit" })

k.set('n', '<leader>h', '<cmd>noh<cr>', { desc = "No highlight" })

k.set('n', '<leader>ff', builtin.find_files, { desc = "Find files" })
k.set('n', '<leader>fg', builtin.live_grep, { desc = "Live grep" })
k.set('n', '<leader>fb', builtin.buffers, { desc = "Buffers" })
k.set('n', '<leader>fh', builtin.help_tags, { desc = "Help" })
k.set('n', '<leader>fc', builtin.colorscheme, { desc = "Colorscheme" })
k.set('n', '<leader>fq', builtin.quickfix, { desc = "Quickfix" })
k.set('n', '<leader>fi', builtin.builtin, { desc = "Builtin pickers" })
k.set('n', '<leader>ft', builtin.treesitter, { desc = "Treesitter" })
k.set('n', '<leader>fs', builtin.lsp_document_symbols, { desc = "Document symbols" })

k.set('n', '<leader>gc', builtin.git_commits, { desc = "Commits" })
k.set('n', '<leader>gt', builtin.git_status, { desc = "Status" })
k.set('n', '<leader>gb', builtin.git_branches, { desc = "Branches" })
k.set('n', '<leader>gs', builtin.git_stash, { desc = "Stash" })

-- window, buffer, tab
k.set("n", "<leader>th", ":split<CR><C-w>w", { desc = "Horizontal split" })
k.set("n", "<leader>tv", ":vsplit<CR><C-w>w", { desc = "Vertical split" })
k.set("n", "<leader>tt", [[<cmd>tabnew<cr>]], { desc = "New tab" })
k.set("n", "<leader>tc", [[<cmd>tabclose<cr>]], { desc = "Close tab" })
k.set("n", "<leader>tn", [[<cmd>tabnext<cr>]], { desc = "Next tab" })
k.set("n", "<leader>tb", [[<cmd>tabprevious<cr>]], { desc = "Previous tab" })
k.set("n", "<leader>te", "<cmd>tabnew<cr><cmd>Oil<cr>", { desc = "File explorer in new tab" })
k.set("n", "<leader>to", "<cmd>tabo<cr>", { desc = "Close all other tabs" })

k.set("n", "th", ":split<CR><C-w>w", { desc = "Horizontal split" })
k.set("n", "tv", ":vsplit<CR><C-w>w", { desc = "Vertical split" })
k.set("n", "tt", [[<cmd>tabnew<cr>]], { desc = "New tab" })
k.set("n", "tc", [[<cmd>tabclose<cr>]], { desc = "Close tab" })
k.set("n", "tn", [[<cmd>tabnext<cr>]], { desc = "Next tab" })
k.set("n", "tb", [[<cmd>tabprevious<cr>]], { desc = "Previous tab" })
k.set("n", "te", "<cmd>tabnew<cr><cmd>Oil<cr>", { desc = "File explorer in new tab" })
k.set("n", "to", "<cmd>tabo<cr>", { desc = "Close all other tabs" })

k.set("n", "<C-l>", "<C-w>l", { desc = "Go to the right split" })
k.set("n", "<C-h>", "<C-w>h", { desc = "Go to the left split" })
k.set("n", "<C-j>", "<C-w>j", { desc = "Go to the down split" })
k.set("n", "<C-k>", "<C-w>k", { desc = "Go to the up split" })

k.set("n", ">", [[<cmd>vertical resize +5<cr>]])
k.set("n", "<", [[<cmd>vertical resize -5<cr>]])
k.set("n", "{", [[<cmd>horizontal resize +2<cr>]])
k.set("n", "}", [[<cmd>horizontal resize -2<cr>]])
--


k.set('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>')
k.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>')
k.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>')

--#code
--



vim.api.nvim_create_autocmd('LspAttach', {
	desc = 'LSP actions',
	callback = function(event)
		k.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', { buffer = event.buf, desc = "Document" })
		k.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', { buffer = event.buf, desc = "Definition" })
		k.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', { buffer = event.buf, desc = "Declaration" })
		k.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', { buffer = event.buf, desc = "Implementation" })
		k.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', { buffer = event.buf, desc = "Type definition" })
		k.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', { buffer = event.buf, desc = "References" })
		k.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', { buffer = event.buf, desc = "Hover" })
		--
		k.set('n', '<leader>cr', '<cmd>lua vim.lsp.buf.rename()<cr>', { buffer = event.buf, desc = "Rename" })
		k.set({ 'n', 'x' }, '<leader>cf', '<cmd>lua vim.lsp.buf.format({async = true})<cr>',
			{ buffer = event.buf, desc = "Format" })
		k.set('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<cr>', { buffer = event.buf, desc = "Action" })
	end
})

-- vim.keymap.set('n', '<C-c>', '"+yi')
k.set('v', '<C-c>', '"+yi')
-- vim.keymap.set('n', '<C-x>', '"+c')
k.set('v', '<C-x>', '"+c')
-- vim.keymap.set('n', '<C-v>', 'c<ESC>"+p')
k.set('v', '<C-v>', 'c<ESC>"+p')
k.set('i', '<C-v>', '<C-r><C-o>+')

-- TOGGLE WRAP
vim.cmd [[
  function! ToggleWrap()
 if (&wrap == 1)
   set nowrap
 else
   set wrap
 endif
endfunction
  map <F9> :call ToggleWrap()<CR>
map! <F9> ^[:call ToggleWrap()<CR>
]]
