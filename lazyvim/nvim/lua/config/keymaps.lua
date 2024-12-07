-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    if opts.remap and not vim.g.vscode then
      opts.remap = nil
    end
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end
-- local map = vim.keymap.set
map({ "n", "v" }, "]]", "$")
map({ "n", "v" }, "[[", "0")
map({ "n" }, "'", "*")
map({ "i" }, "jj", "<esc>")
map({ "n", "v" }, ";", "%")
map({"n", "v"}, "s", "xi")

map("n", "<S-Left>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" })
map("n", "<S-Right>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
-- map("n", "[b", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" })
-- map("n", "]b", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })


-- map({"n", "v"}, "<S-Left>", ":tabprevious<CR>")
-- map({"n", "v"}, "<S-Right>", ":tabnext<CR>")

