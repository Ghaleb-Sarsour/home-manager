return {
    "neovim/nvim-lspconfig",
    dependencies = {
      { "williamboman/mason.nvim", opts = {} },
      "williamboman/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",

      -- Useful status updates for LSP.
      { "j-hui/fidget.nvim", opts = {} }, 
    },
    opts = {
      -- NEW: Configure diagnostic signs to differentiate between LSP and Checkstyle
      diagnostic_signs = {
        { name = "DiagnosticSignError", text = "󰅚" },
        { name = "DiagnosticSignWarn", text = "󰀦" },
        { name = "DiagnosticSignHint", text = "󰌶" },
        { name = "DiagnosticSignInfo", text = "" },
      },
    },
    config = function()

      local servers = {
        jdtls = {},
        lua_ls = {},
        rust_analyzer = {}
      }

      local default_capabilities = vim.lsp.protocol.make_client_capabilities()
      local capabilities = require('blink.cmp').get_lsp_capabilities(default_capabilities)

      require("mason-tool-installer").setup({ ensure_installed = ensure_installed })
      require("mason-lspconfig").setup({
        ensure_installed = {},
        automatic_installation = false;
        handlers = {
          function (server_name)
            local server = servers[server_name] or {}
            server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
            require("lspconfig")[server_name].setup(server)
          end,
        }
      })

      -- NEW: Configure diagnostic display
      vim.diagnostic.config({
        virtual_text = {
          prefix = "",
          source = true,  -- Show source in virtual text
        },
        float = {
          source = true,  -- Show source in hover
        },
        signs = true,
        underline = true,
        update_in_insert = false,
        severity_sort = true,
      })
    end,
  }
