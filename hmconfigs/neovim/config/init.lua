-- Line Numbers
vim.o.number = true
vim.o.relativenumber = true


-- Tabs
vim.o.shiftwidth = 2
vim.o.tabstop = 2


-- Other
vim.o.smoothscroll = true
vim.o.wrap = false
vim.o.swapfile = false
vim.g.mapleader = ' '
vim.o.winborder = 'rounded'
vim.o.signcolumn = 'yes'
vim.o.termguicolors = true


-- Listchars
vim.o.list = true
vim.opt.listchars = {
	tab = "- ",    -- how tabs look (arrow + space)
	lead = ".",
	trail = "·",   -- trailing spaces
	extends = ">", -- when line continues off screen
	precedes = "<", -- when line continues to the left
}


-- Keymaps
vim.keymap.set('n', '<leader>o', ':update<CR> :source<CR>')
vim.keymap.set({ 'v', 'x' }, 'y', '"+y<CR>')
vim.keymap.set('n', '<leader>y', '"+y<CR>')
vim.keymap.set({ 'v', 'x' }, 'd', '"+d<CR>')
vim.keymap.set('n', '<leader>d', '"+d<CR>')
vim.keymap.set('n', '<leader>mm', vim.lsp.buf.format)                              --LSP
vim.keymap.set('n', '<leader>e', ':Oil<CR>')                                       -- Oil
vim.keymap.set({ 'n', 'v' }, '<leader>-', ':Yazi<CR>')                             --Yazi
vim.keymap.set({ 'n', 'v' }, '<leader>ff', function() Snacks.picker.smart() end)   --Snacks Picker
vim.keymap.set({ 'n', 'v' }, '<leader>fb', function() Snacks.picker.buffers() end) --Snacks Picker
vim.keymap.set({ 'n', 'v' }, '<leader>fg', function() Snacks.picker.grep() end)    --Snacks Picker
vim.keymap.set({ 'n', 'v' }, '<leader>fr', function() Snacks.picker.recent() end)  --Snacks Picker
vim.keymap.set({ 'n', 'v' }, '<leader>fh', function() Snacks.picker.undo() end)    --Snacks Picker


-- Plugins
vim.pack.add({
	{ src = "https://github.com/bluz71/vim-moonfly-colors" },
	{ src = "https://github.com/stevearc/oil.nvim" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/mason-org/mason-lspconfig.nvim" },
	{ src = "https://github.com/rafamadriz/friendly-snippets" },
	{ src = "https://github.com/Saghen/blink.cmp" },
	{ src = "https://github.com/m4xshen/autoclose.nvim" },
	{ src = "https://github.com/mikavilpas/yazi.nvim" },
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
	{ src = "https://github.com/folke/snacks.nvim" },
})

require("oil").setup()
require("autoclose").setup()
require("mason").setup()
require("yazi").setup()
require("blink.cmp").setup {
	fuzzy = { implementation = "lua" }
}
require("mason-lspconfig").setup {
	automatic_enable = true,
	ensure_installed = {
		"rust_analyzer",
		"jdtls",
		"lua_ls",
		"asm_lsp",
		"clangd",
		"pylyzer",
		"nil_ls",
	}
}
require("snacks").setup {
	opts = {
		notifier = { enabled = true },
		indent = { enabled = true },
		scroll = { enabled = true },
		picker = { enabled = true },
		animate = { enabled = true },
	},
}


-- Colorscheme
vim.cmd("colorscheme moonfly")
vim.cmd(":hi statusline guibg=NONE")


-- Diagnostic errors/warning
vim.diagnostic.config({
	virtual_text = {
		severity = {
			max = vim.diagnostic.severity.WARN,
		},
	},
	virtual_lines = {
		severity = {
			min = vim.diagnostic.severity.ERROR,
		},
	},
})


-- Lsp
vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true)
			}
		}
	}
})
