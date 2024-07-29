-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Example configs: https://github.com/LunarVim/starter.lvim
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny
lvim.plugins = {
  { "lunarvim/colorschemes" },
  {
    "sainnhe/sonokai",
    lazy = false,
    priority = 1000,
    config = function()
      -- Optionally configure and load the colorscheme
      -- directly inside the plugin declaration.
      -- vim.g.sonokai_enable_italic = true
      vim.g.sonokai_better_performance = 1
      -- vim.g.sonokai_style = 'andromeda'
      -- vim.g.sonokai_style = 'atlantis'
      -- vim.g.sonokai_style = 'shusia'
      -- vim.g.sonokai_style = 'maia'
      -- vim.g.sonokai_style = 'default'
      vim.g.sonokai_style = 'espresso'
    end
  },
  -- {
  --   "sainnhe/edge",
  --   config = function()
  --     vim.g.edge_style = 'default'
  --     vim.g.edge_better_performance = 1
  --   end
  -- },
  -- {
  --   'sainnhe/everforest',
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     -- Optionally configure and load the colorscheme
  --     -- directly inside the plugin declaration.
  --     vim.g.everforest_better_performance = 1
  --     vim.g.everforest_background  = 'hard'
  --   end
  -- },
  { "marko-cerovac/material.nvim" },
  {
    "sainnhe/gruvbox-material",
    lazy = false,
    priority = 1000,
    config = function()
      -- Optionally configure and load the colorscheme
      -- directly inside the plugin declaration.
      -- vim.g.gruvbox_material_enable_italic = true
      -- vim.g.gruvbox_material_background = 'hard'
      vim.g.gruvbox_material_background = 'medium'
      -- vim.g.gruvbox_material_background = 'soft'

      -- vim.g.gruvbox_material_foreground = 'mix'
      -- vim.g.gruvbox_material_foreground = 'material'
      vim.g.gruvbox_material_foreground = 'original'
      vim.g.gruvbox_better_performance = 1
    end
  },
  { "nvimdev/zephyr-nvim" },
  -- {
  --   "stevearc/dressing.nvim",
  --   config = function()
  --     require("dressing").setup({
  --       input = { enabled = false },
  --     })
  --   end,
  -- },
  {
    "nvim-neorg/neorg",
    ft = "norg", -- lazy-load on filetype
    config = true, -- run require("neorg").setup()
  },
}
vim.opt.wrap = true -- wrap lines
lvim.leader = "space"
-- remap end of line since $ is a PITA to reach on qwerty
lvim.keys.normal_mode["]]"] = "$"
lvim.keys.visual_mode["]]"] = "$"
lvim.keys.normal_mode["[["] = "0"
lvim.keys.visual_mode["[["] = "0"
lvim.keys.normal_mode["'"] = "*"
-- Use jj to escape insert mode
lvim.keys.insert_mode["jj"] = "<esc>"

-- lvim.colorscheme = "lunar"
-- lvim.colorscheme = "habamax"
-- lvim.colorscheme = "onenord"
-- lvim.colorscheme = "zephyr"

-- lvim.colorscheme = "onedark"
-- lvim.colorscheme = "onedarker"
-- lvim.colorscheme = "onedarkest"
-- lvim.colorscheme = "darkplus"

-- lvim.colorscheme = "material-darker"
-- lvim.colorscheme = "aurora"
-- lvim.colorscheme = "everforest"
-- lvim.colorscheme = "edge"
-- lvim.colorscheme = "gruvbox-material"
lvim.colorscheme = "sonokai"

-- Switch between nimls or nim_langserver
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "nimls", "nim_langserver" })
-- require'lspconfig'.nimls.setup{}
require'lspconfig'.nim_langserver.setup{}

local formatters = require "lvim.lsp.null-ls.formatters"

-- Doesn't work
-- local helpers = require("null-ls.helpers")
-- local FORMATTING = require("null-ls.methods").internal.FORMATTING
-- require("null-ls").register({
--   --your custom sources go here
--   helpers.make_builtin({
--     name = "nph",
--     meta = {
--       url = "https://github.com/arnetheduck/nph",
--       description = "A linter for Nim."
--     },
--     method = FORMATTING,
--     filetypes = { "nim" },
--     generator_opts = {
--       command = "nph",
--       args = {}, -- put any required arguments in this table
--       to_stdin = false, -- instructs the command to ingest the file from STDIN (i.e. run the currently open buffer through the linter/formatter)
--     },
--     factory = helpers.formatter_factory,
--   })
-- })

formatters.setup {
  {
    name = "black",
    -- filetypes = { "python" },
  },
  {
    name = "ruff",
    filetypes = { "python" },
  },
  {
    name = "goimports",
    filetypes = { "go" },
  },
  -- {
  --   name = "gofumpt",
  --   filetypes = { "go" },
  -- },
  -- {
  --   name = "nph",
  --   filetypes = { "nim" }
  -- }
}
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { name = "flake8" },
  {
    name = "shellcheck",
    args = { "--severity", "warning" },
  },
  {
    command = "golangci-lint",
    filetypes = { "go" },
  },
}

local config = { -- your config
    virtual_text = {prefix = '!'} ,
    underline = true,
    update_in_insert = true,
    float = true,
}
vim.diagnostic.config(config)

lvim.autocommands = {
  {
    "CursorHold",
    {
      pattern = "*",
      callback = function() vim.diagnostic.open_float({scope="line"}) end,
    }
  }
}

vim.opt.updatetime=1500
lvim.format_on_save.enabled = true
lvim.format_on_save.pattern = { "*.nim", "*.py", "*.go" }

-- lvim.builtin.lualine.style = "lvim"
-- no need to set style = "lvim"

local components = require("lvim.core.lualine.components")
lvim.builtin.lualine.sections.lualine_a = { components.mode }
lvim.builtin.lualine.sections.lualine_b = { components.branch, components.diff, components.filename}
lvim.builtin.lualine.sections.lualine_c = { components.diagnostics, }

lvim.builtin.lualine.sections.lualine_x = { components.filetype }
lvim.builtin.lualine.sections.lualine_y = { components.location }
lvim.builtin.lualine.sections.lualine_z = { components.progress }

lvim.keys.normal_mode["gt"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["gT"] = ":BufferLineCyclePrev<CR>"
