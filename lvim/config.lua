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
lvim.leader = ","
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
