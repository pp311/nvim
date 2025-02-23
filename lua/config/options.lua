vim.cmd.colorscheme = "catppuccin"

local o = vim.opt
-- o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"
-- o.laststatus = 2
o.cmdheight = 1

o.smarttab = true
o.number = true
o.relativenumber = true
o.mouse = 'a'
o.smartcase = true
o.ignorecase = true
o.tabstop = 8
o.softtabstop = 0
o.expandtab = true
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


if vim.g.neovide then
    vim.o.guifont = "Liga SFMono Nerd Font:h12"
    vim.o.linespace = 0
    vim.g.neovide_scale_factor = 1.0
    vim.g.neovide_transparency = 0.85
    vim.g.neovide_normal_opacity = 0.85

    vim.g.neovide_refresh_rate = 60
    vim.g.neovide_refresh_rate_idle = 5

    vim.g.neovide_cursor_animation_length = 0.13
    vim.g.neovide_cursor_trail_size = 0.3
    vim.g.neovide_cursor_antialiasing = true
    vim.g.neovide_cursor_animate_in_insert_mode = true
    vim.g.neovide_cursor_animate_command_line = true
    vim.g.neovide_cursor_smooth_blink = false
    vim.g.neovide_cursor_vfx_mode = "pixiedust"

    vim.g.neovide_cursor_vfx_particle_density = 15.0
    vim.g.neovide_cursor_vfx_particle_speed = 10.0
    vim.g.neovide_cursor_vfx_particle_lifetime = 1.2
end
