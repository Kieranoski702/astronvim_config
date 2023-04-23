return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- },
  {"ellisonleao/gruvbox.nvim", lazy = false},
  {"mbbill/undotree", lazy = false},
  {'theprimeagen/harpoon', lazy = false},
  {"folke/zen-mode.nvim", lazy = false},
  {"github/copilot.vim", lazy = false,

		init = function()
			vim.g.copilot_no_tab_map = true
			vim.g.copilot_assume_mapped = true
			vim.g.copilot_tab_fallback = ""
		end,
		config = function()
			vim.keymap.set("i", "<leader><CR>", 'copilot#Accept("<CR>")', { expr = true })
		end,
	},
}
