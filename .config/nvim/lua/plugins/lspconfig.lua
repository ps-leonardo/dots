return
{
  {
    "williamboman/mason.nvim",
    opts = {
      ui = {
        border = "single",
        size = { width = 1, height = 1 },
      }
    }
  },
  {
    "williamboman/mason-lspconfig.nvim",
  opts = {
    ensure_installed = { "lua_ls" },
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({})
      lspconfig.basedpyright.setup({})
      lspconfig.hyprls.setup({})
    end
  }
}
