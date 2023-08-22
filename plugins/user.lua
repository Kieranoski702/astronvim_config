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
  {
    "ellisonleao/gruvbox.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      italic = {
        strings = false,
        comments = false,
      },
    },
  },
  { "mbbill/undotree", lazy = false },
  { "christoomey/vim-tmux-navigator", lazy = false },
  { "tpope/vim-obsession" },
  { "jbyuki/instant.nvim" },
  { "MunifTanjim/nui.nvim" },
  { "ShinKage/idris2-nvim" },
  {
    "jackMort/ChatGPT.nvim",
    event = "VeryLazy",
    config = function()
      require("chatgpt").setup {
        popup_input = {
          submit = "<C-s>",
        },
      }
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
  },
  { "quarto-dev/quarto-nvim" },
  { "jmbuhr/otter.nvim" },
  {
    "tpope/vim-fugitive",
    opt = true,
    cmd = {
      "Git",
      "Gdiffsplit",
      "Gread",
      "Gwrite",
      "Ggrep",
      "GMove",
      "GDelete",
      "GBrowse",
      "GRemove",
      "GRename",
      "Glgrep",
      "Gedit",
    },
    {
      "lambdalisue/suda.vim",
      cmd = {
        "SudaRead",
        "SudaWrite",
      },
    },
    {
      "kylechui/nvim-surround",
      version = "*", -- Use for stability; omit to use `main` branch for the latest features
      event = "VeryLazy",
      config = function()
        require("nvim-surround").setup {
          -- Configuration here, or leave empty to use defaults
        }
      end,
    },
    {
      "sickill/vim-pasta",
      config = function() vim.g["pasta_enabled_filetypes"] = { "python" } end,
    },
    {
      "EtiamNullam/deferred-clipboard.nvim",
      config = function() require("deferred-clipboard").setup {} end,
    },
  },

  -- { "theprimeagen/harpoon", lazy = false },
  -- { "folke/zen-mode.nvim",  lazy = false },
  -- {
  -- 	"github/copilot.vim",
  -- 	lazy = false,
  -- 	init = function()
  -- 		vim.g.copilot_no_tab_map = true
  -- 		vim.g.copilot_assume_mapped = true
  -- 		vim.g.copilot_tab_fallback = ""
  -- 	end,
  -- 	config = function()
  -- 		vim.keymap.set("i", "<C-y>", 'copilot#Accept("<CR>")', { expr = true })
  -- 	end,
  -- },
}
