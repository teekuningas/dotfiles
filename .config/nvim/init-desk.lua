-- init.lua

-- Load the Vim configuration from the .vimrc-custom
if vim.fn.filereadable(vim.fn.expand("~/.vimrc-custom")) then
  vim.cmd('source ~/.vimrc-custom')
end

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Set mapleader before lazy.nvim setup
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require('lazy').setup({
  spec = {
    -- Existing plugin configurations can go here
    {
      "robitx/gp.nvim",
      config = function()
        local conf = {
          providers = {
            ollama = {
              disable = false,
              endpoint = "https://jyu2401-62.tail5b278e.ts.net/v1/chat/completions"
            },
          },
          default_command_agent = 'jyu2401-llama',
          default_chat_agent = 'jyu2401-llama',
          agents = {
            {
              provider = "ollama",
              name = "jyu2401-llama",
              chat = false,
              command = true,
              model = {
                model = "gemma3:27b",
                temperature = 0.4,
                top_p = 1,
                min_p = 0.05,
              },
              system_prompt = require("gp.defaults").code_system_prompt,
            }
          }
        }
        require("gp").setup(conf)
        -- Setup shortcuts here
        -- Example: vim.keymap.set({ 'n', 'v' }, '<Tab>', ':Gen<CR>')
      end
    },
    {
      "nvim-neo-tree/neo-tree.nvim",
      branch = "v3.x",
      dependencies = {
        "nvim-lua/plenary.nvim",               -- Utility functions
        "nvim-tree/nvim-web-devicons",         -- Optional, but recommended for icons
        "MunifTanjim/nui.nvim",                -- Required for the UI components
      },
      config = function()
        require("neo-tree").setup({
          window = {
            position = "left",                -- Position of the Neo-tree window
            width = 40,                       -- Width of the window
          },
          filesystem = {
            filtered_items = {
              hide_dotfiles = true,        -- Hide dotfiles
              hide_gitignored = true,      -- Hide gitignored files
            },
          }
        })

        -- Key mapping to reveal the Neo-tree
        vim.keymap.set("n", "<leader>e", "<Cmd>Neotree reveal<CR>")
      end
    },
  },
  install = { colorscheme = { "habamax" } },
  checker = { enabled = true },
})
