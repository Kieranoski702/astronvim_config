return {
  -- Configure AstroNvim updates
  updater = {
    remote = "origin", -- remote to use
    channel = "stable", -- "stable" or "nightly"
    version = "latest", -- "latest", tag name, or regex search like "v1.*" to only do updates before v2 (STABLE ONLY)
    branch = "nightly", -- branch name (NIGHTLY ONLY)
    commit = nil, -- commit hash (NIGHTLY ONLY)
    pin_plugins = nil, -- nil, true, false (nil will pin plugins on stable only)
    skip_prompts = false, -- skip prompts about breaking changes
    show_changelog = true, -- show the changelog after performing an update
    auto_quit = false, -- automatically quit the current session after a successful update
    remotes = { -- easily add new remotes to track
      --   ["remote_name"] = "https://remote_url.come/repo.git", -- full remote url
      --   ["remote2"] = "github_user/repo", -- GitHub user/repo shortcut,
      --   ["remote3"] = "github_user", -- GitHub user assume AstroNvim fork
    },
  },
  -- Set colorscheme to use
  colorscheme = "gruvbox",
  -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
  diagnostics = {
    virtual_text = true,
    underline = true,
  },
  lsp = {
    -- customize lsp formatting options
    formatting = {
      -- control auto formatting on save
      format_on_save = {
        enabled = true, -- enable or disable format on save globally
        allow_filetypes = { -- enable format on save for specified filetypes only
          -- "go",
        },
        ignore_filetypes = { -- disable format on save for specified filetypes
          -- "python",
        },
      },
      disabled = { -- disable formatting capabilities for the listed language servers
        -- disable lua_ls formatting capability if you want to use StyLua to format your lua code
        -- "lua_ls",
      },
      timeout_ms = 1000, -- default format timeout
      -- filter = function(client) -- fully override the default formatting function
      --   return true
      -- end
    },
    -- enable servers that you already have installed without mason
    servers = {
      -- "pyright"
    },
  },
  -- Configure require("lazy").setup() options
  lazy = {
    defaults = { lazy = true },
    performance = {
      rtp = {
        -- customize default disabled vim plugins
        disabled_plugins = { "tohtml", "gzip", "matchit", "zipPlugin", "netrwPlugin", "tarPlugin" },
      },
    },
  },
  -- This function is run last and is a good place to configuring
  -- augroups/autocommands and custom filetypes also this just pure lua so
  -- anything that doesn't fit in the normal config locations above can go here
  polish = function()
    -- Set up custom filetypes
    -- vim.filetype.add {
    --   extension = {
    --     foo = "fooscript",
    --   },
    --   filename = {
    --     ["Foofile"] = "fooscript",
    --   },
    --   pattern = {
    --     ["~/%.config/foo/.*"] = "fooscript",
    --   },
    -- }
    -- Set colour column to 88 in py files
    vim.cmd [[
      augroup AstroNvim
        autocmd!
        autocmd FileType python setlocal colorcolumn=88
      augroup END
    ]]
    -- Fix clangd error for utf-16 encoding
    -- local capabilities = vim.lsp.protocol.make_client_capabilities()
    -- capabilities.offsetEncoding = { "utf-16" }
    -- require("lspconfig").clangd.setup { capabilities = capabilities }
    local cmp_nvim_lsp = require "cmp_nvim_lsp"
    require("lspconfig").clangd.setup {
      on_attach = on_attach,
      capabilities = cmp_nvim_lsp.default_capabilities(),
      cmd = {
        "clangd",
        "--offset-encoding=utf-16",
      },
    }
    -- Change ltex lsp language to en-GB for spell checking
    local ltex_opts = {
      settings = {
        ltex = {
          language = "en-GB",
        },
      },
    }
    require("lspconfig")["ltex"].setup(ltex_opts)
    -- This may not be needed to fix the issue and mat break other null-ls sources
    require("null-ls").setup {
      on_init = function(new_client, _) new_client.offset_encoding = "utf-16" end,
    }
    -- Setup idris2 lsp
    require("idris2").setup {}
    -- Set rust analyzer to use clippy on save instead of cargo check
    require("rust-tools").setup {
      server = {
        settings = {
          ["rust-analyzer"] = {
            checkOnSave = {
              allFeatures = true,
              overrideCommand = {
                "cargo",
                "clippy",
                "--workspace",
                "--message-format=json",
                "--all-targets",
                "--all-features",
              },
            },
          },
        },
      },
    }
  end,
}
