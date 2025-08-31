return {
  "mason-org/mason.nvim",
  config = function()
    require("mason").setup({
      ensure_installed = {
        "jdtls",
        "luals",
        "nil",
        "pylyzer",
        "rust-analyzer",
        "typescript-language-server",
      },
    })
  end,
}
