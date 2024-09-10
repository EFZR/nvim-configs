return {
  "iabdelkareem/csharp.nvim",
  dependencies = {
    "williamboman/mason.nvim", -- Required, automatically installs omnisharp
    "mfussenegger/nvim-dap",
    "Tastyep/structlog.nvim", -- Optional, but highly recommended for debugging
  },
  config = function()
    require("mason").setup() -- Mason setup must run before csharp, only if you want to use omnisharp
    require("csharp").setup()
  end,
}
