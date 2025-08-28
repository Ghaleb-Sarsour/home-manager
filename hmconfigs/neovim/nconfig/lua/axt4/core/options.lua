vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt

--Numbers
opt.number = true
--opt.relativenumber = true

--Spelling
opt.spell = true
opt.spelllang = { "en_us" }
--Tabs
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true 
opt.autoindent = true

--Wrapping
opt.wrap = false

--Search
opt.ignorecase = true
opt.smartcase = true

--Line Highlight
opt.cursorline = true

--Colorscheme Settings
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

--Backspace
opt.backspace = "indent,eol,start"

--System Clipboard

--Window Splitting
opt.splitright = true
opt.splitbelow = true

--Swapfile
opt.swapfile = false

--Neovide Specific Settings
if vim.g.neovide then
  vim.o.guifont = "FiraCode Nerd Font:h20" -- text below applies for VimScript
  vim.g.neovide_transparency = 0.95
  vim.g.neovide_normal_opacity = 1
  vim.g.neovide_refresh_rate = 60
  vim.g.neovide_cursor_trail_size = 0.5
end




