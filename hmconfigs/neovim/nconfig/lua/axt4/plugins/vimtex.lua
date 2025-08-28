return {
  "lervag/vimtex",
  -- lazy = false,     -- we don't want to lazy load VimTeX
  ft = "tex",
  -- tag = "v2.15", -- uncomment to pin to a specific release
  init = function()
    -- VimTeX configuration goes here, e.g.
    vim.cmd [[
        filetype plugin indent on
        syntax enable
        let g:vimtex_view_method = 'zathura'
    ]]
  end
}
