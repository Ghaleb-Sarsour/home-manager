 return {
  'MeanderingProgrammer/render-markdown.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons'},
  config = function()
    vim.opt.termguicolors = true  -- Essential for color support

    -- First define highlight groups
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

    -- Configure plugin AFTER setting highlights
    require('render-markdown').setup({
      completions = { lsp = { enabled = true } },
      bullet = { icons = { '', '󰋙', '◆', '◇', '', '○' } },
      heading = { 
        signs = {'󰫎', '󰫍'},
        icons = { '󰎤 ', '󰎧 ', '󰎪 ', '󰎭 ', '󰎱 ', '󰎳 '}, 
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
    })
  end,
}
