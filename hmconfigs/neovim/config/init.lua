-- Line Numbers
vim.o.number = true
vim.o.relativenumber = true


-- Tabs
vim.o.shiftwidth = 2
vim.o.tabstop = 2


-- Other
vim.o.spell = true
vim.o.spelllang = "en_us"
vim.o.smoothscroll = true
vim.o.wrap = false
vim.o.swapfile = false
vim.g.mapleader = ' '
vim.o.winborder = 'rounded'
vim.o.signcolumn = 'yes'
vim.o.termguicolors = true


--Folding:
vim.defer_fn(function()
	vim.api.nvim_set_hl(0, "Folded", { fg = "white", bg = "darkblue" })
end, 50)
vim.o.foldenable = true
vim.o.foldlevel = 99
vim.o.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.o.foldtext = ""
vim.opt.foldcolumn = "0"
vim.opt.fillchars:append({ fold = " " })
vim.o.foldmethod = 'expr'
-- Default to treesitter folding
vim.o.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
-- Prefer LSP folding if client supports it
vim.api.nvim_create_autocmd('LspAttach', {
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if client:supports_method('textDocument/foldingRange') then
			local win = vim.api.nvim_get_current_win()
			vim.wo[win][0].foldexpr = 'v:lua.vim.lsp.foldexpr()'
		end
	end,
})


-- Todo color highlighting
local set_highlights = function()
	-- Unchecked items (white text and icon)
	vim.api.nvim_set_hl(0, 'RenderMarkdownUnchecked', {
		fg = '#FFFFFF', ctermfg = 'White', bold = false
	})

	-- Checked items (green text and icon)
	vim.api.nvim_set_hl(0, 'RenderMarkdownChecked', {
		fg = '#AEF0A3', ctermfg = 'Green', bold = false
	})

	-- Custom status highlights
	vim.api.nvim_set_hl(0, 'RenderMarkdownImportant', {
		fg = '#F5011A', ctermfg = 'Red', bold = false
	})
	vim.api.nvim_set_hl(0, 'RenderMarkdownRecurring', {
		fg = '#78A1F5', ctermfg = 'Blue', bold = false
	})
	vim.api.nvim_set_hl(0, 'RenderMarkdownInProgress', {
		fg = '#F5F28B', ctermfg = 'Yellow', bold = false
	})
end


-- Apply highlights immediately
set_highlights()


-- Re-apply when colorscheme changes
vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = "*",
	callback = set_highlights
})


-- Listchars
vim.o.list = true
vim.opt.listchars = {
	tab = "- ",    -- how tabs look (arrow + space)
	lead = ".",
	trail = "·",   -- trailing spaces
	extends = ">", -- when line continues off screen
	precedes = "<", -- when line continues to the left
}


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
	{ src = "https://github.com/nvim-tree/nvim-web-devicons" },
	{ src = "https://github.com/MeanderingProgrammer/render-markdown.nvim" },
	{ src = "https://github.com/nosduco/remote-sshfs.nvim" },
	{ src = "https://github.com/nvim-telescope/telescope.nvim" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
	{ src = "https://github.com/brianhuster/live-preview.nvim" },
	{ src = "https://github.com/kawre/leetcode.nvim" },
	{ src = "https://github.com/MunifTanjim/nui.nvim" },
	{ src = "https://github.com/vyfor/cord.nvim" },
	{ src = "https://github.com/seblyng/roslyn.nvim" },
	{ src = "https://github.com/stevearc/conform.nvim" },
})

require('leetcode').setup()
require('livepreview.config').set()
require("telescope").load_extension 'remote-sshfs'
require('remote-sshfs').setup()
require("oil").setup()
require("autoclose").setup()
require("yazi").setup()
require("nvim-treesitter").setup()
require("nvim-treesitter").install {
	'asm',
	'c',
	'c_sharp',
	'css',
	'html',
	'java',
	'json',
	'lua',
	'markdown',
	'nix',
	'python',
	'rust',
}
require('cord').setup {}
require("blink.cmp").setup {
	fuzzy = { implementation = "lua" },
	keymap = {
		preset = 'default',
		['<Down>'] = {},
		['<Up>'] = {},
	},
}
require("mason").setup {
	registries = {
		"github:Crashdummyy/mason-registry",
		"github:mason-org/mason-registry",
	},
}
require("mason-lspconfig").setup {
	automatic_enable = true,
	ensure_installed = {
		"rust_analyzer",
		"jdtls",
		"lua_ls",
		"asm_lsp",
		"clangd",
		"basedpyright",
		"verible",
		"nil_ls",
		"djlsp",
		"html",
		"cssls",
	}
}
require('conform').setup({
	formatters_by_ft = {
		html = { "superhtml" },
	}
})
require("snacks").setup {
	opts = {
		notifier = { enabled = true },
		indent = { enabled = true },
		scroll = { enabled = true },
		picker = { enabled = true },
		animate = { enabled = true },
	},
}
require('render-markdown').setup {
	completions = { lsp = { enabled = true } },
	bullet = { icons = { '', '󰋙', '◆', '◇', '', '○' } },
	heading = {
		signs = { '󰫎', '󰫍' },
		icons = { '󰎤 ', '󰎧 ', '󰎪 ', '󰎭 ', '󰎱 ', '󰎳 ' },
		position = 'overlay',
	},
	checkbox = {
		enabled = true,
		render_modes = false,
		right_pad = 1,
		unchecked = {
			icon = '󰄱 ',
			highlight = 'RenderMarkdownUnchecked',
			scope_highlight = 'RenderMarkdownUnchecked',
		},
		checked = {
			icon = '󰱒 ',
			highlight = 'RenderMarkdownChecked',
			scope_highlight = 'RenderMarkdownChecked',
		},
		custom = {
			important = {
				raw = '[!]',
				rendered = ' ',
				highlight = 'RenderMarkdownImportant',
				scope_highlight = 'RenderMarkdownImportant'
			},
			recurring = {
				raw = '[R]',
				rendered = ' ',
				highlight = 'RenderMarkdownRecurring',
				scope_highlight = 'RenderMarkdownRecurring'
			},
			in_progress = {
				raw = '[P]',
				rendered = ' ',
				highlight = 'RenderMarkdownInProgress',
				scope_highlight = 'RenderMarkdownInProgress'
			},
		},
	},
}

-- Keymaps
vim.keymap.set('n', '<leader>o', ':update<CR> :source<CR>')
vim.keymap.set({ 'v', 'x' }, 'y', '"+y<CR>')
vim.keymap.set('n', '<leader>y', '"+y<CR>')
vim.keymap.set({ 'v', 'x' }, 'd', '"+d<CR>')
vim.keymap.set('n', '<leader>d', '"+d<CR>')
vim.keymap.set('n', '<leader>e', ':Oil<CR>')                                       -- Oil
vim.keymap.set({ 'n', 'v' }, '<leader>-', ':Yazi<CR>')                             --Yazi
vim.keymap.set({ 'n', 'v' }, '<leader>fs', function() Snacks.picker.smart() end)   --Snacks Picker
vim.keymap.set({ 'n', 'v' }, '<leader>ff', function() Snacks.picker.files() end)   --Snacks Picker
vim.keymap.set({ 'n', 'v' }, '<leader>fb', function() Snacks.picker.buffers() end) --Snacks Picker
vim.keymap.set({ 'n', 'v' }, '<leader>fg', function() Snacks.picker.grep() end)    --Snacks Picker
vim.keymap.set({ 'n', 'v' }, '<leader>fr', function() Snacks.picker.recent() end)  --Snacks Picker
vim.keymap.set({ 'n', 'v' }, '<leader>fh', function() Snacks.picker.undo() end)    --Snacks Picker
vim.keymap.set('n', '<leader>mm', function()                                       -- Formatting Conform.nvim
	require("conform").format({ async = true, lsp_fallback = true })
end)



-- Treesitter
vim.api.nvim_create_autocmd('FileType', {
	pattern = { '<filetype>' },
	callback = function() vim.treesitter.start() end,
})


-- Colorscheme
vim.cmd("colorscheme moonfly")
vim.cmd(":hi statusline guibg=NONE")


-- Diagnostic errors/warning
-- vim.diagnostic.config({
-- 	virtual_text = {
-- 		severity = {
-- 			-- min = vim.diagnostic.severity.WARN,
-- 			max = vim.diagnostic.severity.ERROR,
-- 		},
-- 	},
-- virtual_lines = {
-- 	severity = {
-- 		min = vim.diagnostic.severity.ERROR,
-- 	},
-- },
-- })

-- Formatter
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)

	end,
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

local roslyn_loaded = false
vim.api.nvim_create_autocmd('FileType', {
	pattern = 'cs',
	callback = function()
		if not roslyn_loaded then
			-- Ensure the plugin is loaded
			vim.cmd('packadd roslyn.nvim')
			require('roslyn').setup({
				filewatching = "roslyn",
			})
			roslyn_loaded = true
		end
	end,
})
