return {
  {
    "sainnhe/sonokai",
    lazy = false,
    priority = 1000,
    config = function()
      -- require("sonokai").setup({
      --   style = "espresso",
      -- })
      -- Optionally configure and load the colorscheme
      -- directly inside the plugin declaration.
      -- vim.g.sonokai_enable_italic = true
      vim.g.sonokai_better_performance = 1
      -- vim.g.sonokai_style = 'andromeda'
      -- vim.g.sonokai_style = 'atlantis'
      -- vim.g.sonokai_style = 'shusia'
      -- vim.g.sonokai_style = 'maia'
      -- vim.g.sonokai_style = 'default'
      vim.g.sonokai_style = "espresso"
      -- require("sonokai").load()
    end,
  },
  { "marko-cerovac/material.nvim" },
  {
    "sainnhe/gruvbox-material",
    lazy = false,
    priority = 1000,
    config = function()
      -- require("gruvbox-material").setup({
      --   style = "medium",
      -- })
      -- Optionally configure and load the colorscheme
      -- directly inside the plugin declaration.
      -- vim.g.gruvbox_material_enable_italic = true
      -- vim.g.gruvbox_material_background = 'hard'
      -- vim.g.gruvbox_material_background = "medium"
      -- vim.g.gruvbox_material_background = 'soft'
      -- vim.g.gruvbox_material_foreground = 'mix'
      vim.g.gruvbox_material_foreground = "original"
      vim.g.gruvbox_material_foreground = "material"
      vim.g.gruvbox_better_performance = 1
      -- require("gruvbox-materail").load()
    end,
  },
  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "gruvbox-material"
      colorscheme = "sonokai",
    },
  },
}
