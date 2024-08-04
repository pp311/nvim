vim.cmd.colorscheme = "catppuccin"

local o = vim.opt
-- o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"
-- o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"
-- o.laststatus = 2
o.cmdheight = 1

o.smarttab = true
o.number = true
o.relativenumber = true
o.mouse = 'a'
o.smartcase = true
o.ignorecase = true
o.tabstop = 4
o.shiftwidth = 4
o.termguicolors = true
o.splitright = true
o.scrolloff = 7
o.cursorline = true
o.timeoutlen = 300
o.pumheight = 10
o.hlsearch = true
o.guifont = "Liga SFMono Nerd Font:h12"
o.hidden = true
-- o.swapfile = false

vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)


-- BLAMER
vim.g.blamer_enabled = 1
vim.g.blamer_delay = 1000
vim.g.blamer_prefix = ' '
vim.g.blamer_format = ' %committer | %committer-time | %summary'

