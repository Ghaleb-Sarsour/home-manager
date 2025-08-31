return {
  {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local lint = require("lint")

      -- Configure checkstyle
      lint.linters.checkstyle = {
        cmd = "java",
        args = {
          "-jar",
          -- Update this path to where you store checkstyle jar
          vim.fn.expand("~/.config/home-manager/hmconfigs/neovim/uconfig/lsp/checkstyle-10.14.2-all.jar"),
          "-c",
          -- Update this path to your custom checkstyle ruleset
          vim.fn.expand("~/.config/home-manager/hmconfigs/neovim/uconfig/lsp/CS1332-checkstyle.xml"),
          "-f",
          "plain",
        },

        stdin = false,
        stream = "stdout",
        ignore_exitcode = true,
        parser = function(output)
          local diagnostics = {}
          for line in output:gmatch("[^\r\n]+") do
            -- Parse checkstyle output format
            local file, line_num, col, message = line:match("^([^:]+):(%d+):(%d+): (.+)$")
            if line_num and message then
              table.insert(diagnostics, {
                lnum = tonumber(line_num) - 1,
                col = tonumber(col),
                -- NEW: Added prefix to distinguish from LSP messages
                message = "[Checkstyle] " .. message,
                severity = vim.diagnostic.severity.WARN,
                -- NEW: Added source field to distinguish from LSP
                source = "checkstyle",
              })
            end
          end
          return diagnostics
        end
      }

      -- Assign checkstyle to Java files
      lint.linters_by_ft = {
        java = { "checkstyle" }
      }

      -- Create an autocommand to trigger linting
      vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
        callback = function()
          lint.try_lint()
        end,
      })
    end,
  }
}


