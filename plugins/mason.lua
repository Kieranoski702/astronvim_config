-- customize mason plugins
local utils = require "astronvim.utils"
return {
  -- {
  --   "nvim-treesitter/nvim-treesitter",
  --   opts = function(_, opts)
  --     if opts.ensure_installed ~= "all" then
  --       opts.ensure_installed = utils.list_insert_unique(opts.ensure_installed, { "markdown", "markdown_inline" })
  --     end
  --   end,
  -- },
  {
    "williamboman/mason-lspconfig.nvim",
    -- opts = function(_, opts) opts.ensure_installed = utils.list_insert_unique(opts.ensure_installed, { "ocamllsp" }) end,
  },
  {
    "jay-babu/mason-null-ls.nvim",
    -- opts = function(_, opts) opts.ensure_installed = utils.list_insert_unique(opts.ensure_installed, "ocamlformat") end,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    opts = function(_, opts) opts.ensure_installed = utils.list_insert_unique(opts.ensure_installed, "cppdbg") end,
  },
}
