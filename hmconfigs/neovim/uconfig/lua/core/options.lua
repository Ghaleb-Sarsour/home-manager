vim.cmd('let g:netrw_liststyle = 3')

vim.defer_fn(function()
  vim.api.nvim_set_hl(0, "Folded", { fg = "white", bg = "darkblue" })
end, 50)

local opt = vim.opt

--Numbers
opt.number = true
opt.relativenumber = true

--Spelling
opt.spell = true
opt.spelllang = { "en_us" }

--Tabs
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

--Window Splitting
opt.splitright = true
opt.splitbelow = true

--Swapfile
opt.swapfile = false

--Folding:
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

--LSP:
vim.diagnostic.config({
  virtual_text = false,
  update_in_insert = false,
})

vim.o.updatetime = 250

-- Create a group for our autocommands to avoid duplicates
local augroup = vim.api.nvim_create_augroup("DiagnosticFloat", { clear = true })

-- Track insert mode
local in_insert_mode = false

vim.api.nvim_create_autocmd('InsertEnter', {
  group = augroup,
  callback = function() in_insert_mode = true end
})

vim.api.nvim_create_autocmd('InsertLeave', {
  group = augroup,
  callback = function() in_insert_mode = false end
})

-- Show diagnostic float on CursorHold (normal mode)
vim.api.nvim_create_autocmd('CursorHold', {
  group = augroup,
  callback = function()
    if not in_insert_mode then
      vim.diagnostic.open_float(nil, { focus = false })
    end
  end
})


vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)

    if client:supports_method('textDocument/inlayHint') then
      vim.lsp.inlay_hint.enable(false, { bufnr = args.buf })
    end

    -- Disable info hover
    vim.lsp.handlers["textDocument/hover"] = function() end
  end,
})

--Neovide Specific Settings
if vim.g.neovide then
  vim.o.guifont = "FiraCode Nerd Font:h17"
  vim.g.neovide_opacity = 0.95
  vim.g.neovide_normal_opacity = 1
  vim.g.neovide_refresh_rate = 60
  vim.g.neovide_cursor_trail_size = 0.5
end

-- Notifications snacks
---@type table<number, {token:lsp.ProgressToken, msg:string, done:boolean}[]>
local progress = vim.defaulttable()
vim.api.nvim_create_autocmd("LspProgress", {
  ---@param ev {data: {client_id: integer, params: lsp.ProgressParams}}
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    local value = ev.data.params
        .value --[[@as {percentage?: number, title?: string, message?: string, kind: "begin" | "report" | "end"}]]
    if not client or type(value) ~= "table" then
      return
    end
    local p = progress[client.id]

    for i = 1, #p + 1 do
      if i == #p + 1 or p[i].token == ev.data.params.token then
        p[i] = {
          token = ev.data.params.token,
          msg = ("[%3d%%] %s%s"):format(
            value.kind == "end" and 100 or value.percentage or 100,
            value.title or "",
            value.message and (" **%s**"):format(value.message) or ""
          ),
          done = value.kind == "end",
        }
        break
      end
    end

    local msg = {} ---@type string[]
    progress[client.id] = vim.tbl_filter(function(v)
      return table.insert(msg, v.msg) or not v.done
    end, p)

    -- Check if current mode is insert before showing notification
    local current_mode = vim.api.nvim_get_mode().mode
    if current_mode:match("^i") then
      return
    end

    local spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }
    vim.notify(table.concat(msg, "\n"), "info", {
      id = "lsp_progress",
      title = client.name,
      opts = function(notif)
        notif.icon = #progress[client.id] == 0 and " "
            or spinner[math.floor(vim.uv.hrtime() / (1e6 * 80)) % #spinner + 1]
      end,
    })
  end,
})
