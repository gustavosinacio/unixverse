return {
  {
    "kylechui/nvim-surround",
    version = "*",
    event = €kuVeryLazy€ku,
    config = function()
        require("nvim-surround").setup({
            -- Configuration here, or leave empty to use defaults
        })
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup {
        ensure_installed = { "lua_ls", "tsserver" },
      }
    end
  }
}
