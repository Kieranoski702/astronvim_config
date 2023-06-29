-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map
    -- mappings seen under group name "Buffer"
    ["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(
          function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
        )
      end,
      desc = "Pick to close",
    },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
    -- Create floating window for error diagnostic
    ["<leader>m"] = {
      function() vim.diagnostic.open_float() end,
      desc = "Open diagnostic float window",
    },
    ["<leader>z"] = { name = "Custom" },
    ["<leader>zu"] = {
      function() vim.cmd.UndotreeToggle() end,
      desc = "Toggle undo tree",
    },
    ["<leader>zz"] = {
      function() require("zen-mode").toggle() end,
      desc = "Toggle zen mode",
    },
    ["<leader>zc"] = {
      function() require("chatgpt").openChat() end,
      desc = "Open ChatGPT window",
    },
    -- add overwrite mapping for vim-tmux-navigator
    ["<C-h>"] = { ":TmuxNavigateLeft<CR>", desc = "window left" },
    ["<C-l>"] = { ":TmuxNavigateRight<CR>", desc = "window right" },
    ["<C-k>"] = { ":TmuxNavigateUp<CR>", desc = "window up" },
    ["<C-j>"] = { ":TmuxNavigateUp<CR>", desc = "window down" },
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
  v = {
    ["<leader>e"] = {
      function() require("chatgpt").edit_with_instructions() end,
      desc = "Edit with instructions",
    },
  },
}
