return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",
  dependencies = {},

  config = function()
    -- import nvim-treesitter plugin
   local treesitter = require("nvim-treesitter.configs")
   vim.api.nvim_set_hl(0, "@variable", { fg = "#00ff9c" })  -- Sets variable names to a specific color
    -- configure treesitter
    treesitter.setup({ -- enable syntax highlighting
      highlight = {
        enable = true,
        custom_captures = {
            ["variable"] = "TSVariable",
            ["@variable"] = "TSVariable",
        },
      },
      -- enable indentation
      indent = { enable = true },
      -- ensure these language parsers are installed
      ensure_installed = {
        "json",
        "nix",
        "c_sharp",
        "javascript",
        "typescript",
        "tsx",
        "yaml",
        "html",
        "css",
        "prisma",
        "markdown",
        "markdown_inline",
        "svelte",
        "graphql",
        "bash",
        "lua",
        "vim",
        "dockerfile",
        "gitignore",
        "query",
        "vimdoc",
        "rust",
        "latex",
        "c",
        "java",
        "python",
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = false,
          node_decremental = "<bs>",
        },
      },
    })
  end,
}
