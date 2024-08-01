vim.cmd.colorscheme = "catppuccin"

local o = vim.opt

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

vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)


