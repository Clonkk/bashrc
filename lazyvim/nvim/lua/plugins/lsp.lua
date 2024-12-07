-- LSP keymaps
return {
  {
    "neovim/nvim-lspconfig",
    -- init = function()
    opts = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      local lspconfig = require("lspconfig")
      local util = require'lspconfig.util'
      local cmd = {'gopls', '--remote=auto'}
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      lspconfig.pylsp.setup({})
      lspconfig.nim_langserver.setup({})
      lspconfig.gopls.setup({
        capabilities = capabilities,
        cmd = cmd,
        filetypes = { "go", "gomod", "gowork", "gotmpl" },
        root_dir = util.root_pattern("go.work", "go.mod", ".git"),
        settings = {
          gopls = {
          directoryFilters = {
             "-bazel-bin",
             "-bazel-out",
             "-bazel-testlogs",
             "-bazel-mypkg",
          },
          completeUnimported = true,
          usePlaceholders = true,
            analyses = {
              unusedparams = true,
            },
            staticcheck = true,
            gofumpt = true,
          },
        },
      })

      -- disable a keymap
      keys[#keys + 1] = { "[[", false }
      keys[#keys + 1] = { "]]", false }
      -- enable a keymap
      keys[#keys + 1] = { "gh", vim.diagnostic.open_float, mode = "n" }
    end,
  },
  {
    "folke/snacks.nvim",
    keys = {
      {"[[", false},
      {"]]", false},
    },
  },
}
