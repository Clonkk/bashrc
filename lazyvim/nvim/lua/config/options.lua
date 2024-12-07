-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.showmatch = true
-- vim.opt.lazyredraw = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.ai = true
vim.opt.si = true
vim.opt.expandtab = true
vim.opt.mouse = 'a'
vim.opt.number = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.visualbell = true
-- vim.opt.noerrorbells = true
vim.opt.updatetime = 200
-- vim.nobackup = true
-- vim.nowritebackup = true
vim.foldlevelstart = 99
vim.opt.smartindent = true
vim.opt.relativenumber = false
vim.opt.wrap = true -- wrap lines
vim.g.autoformat = false
local opt = vim.opt

-- opt.timeoutlen = 1000

vim.g.root_spec = {
  -- first do file-based root detection
  { ".git", "_darcs", ".hg", ".bzr", ".svn" },
  -- fallback to lsp root detection
  "lsp",
  -- fallback to current working dir
  "cwd",
}

-- Automatically reload file when changed on disk
opt.autoread = true
