-- Bootstrap lazy vim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- Auto install lazy.nvim if not present
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
  print('Done.')
end
vim.opt.rtp:prepend(lazypath)

-- Add in all of the plugins.
-- I use this instead of require("lazy").setup("plugins") to have more granular control
--   over what plugins are used and what aren't. This is useful for when you are debugging
--   what plugin is causing the issue.
-- I am also not quite sure if there can be issues caused by the order of these plugin
--   installations.
require("lazy").setup({
  require('plugins.nvim-treesitter'),
  require('plugins.nvim-lspconfig'),
  require('plugins.blink'),
  require('plugins.telescope'),
  require('plugins.nvim-tmux-nav'),
  require('plugins.nvimtree'),
  require('plugins.colorschemes'),
  install = { colorscheme = { 'tokyonight-storm' }},
  checker = { enabled = true },
})
