---------- Global Settings Start ---------- 
-- Set the leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Disable netrw for nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
---------- Global Settings End ---------- 

-- Reserve a space in the gutter
-- This will avoid an annoying layout shift in the screen
vim.opt.signcolumn = 'yes'

vim.opt.clipboard = 'unnamedplus'                     -- use system clipboard
vim.opt.mouse = 'a'                                   -- allow the mouse to be used in Nvim
vim.opt.completeopt = {'menu', 'menuone', 'noselect'} -- set insert mode completion support

-- Tab
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true

-- UI config
vim.opt.number = true          -- show absolute number
vim.opt.relativenumber = true  -- set relative numbering
vim.opt.cursorline = true      -- make the cursor line horizontal
vim.opt.splitright = true      -- open vertical splits right
vim.opt.splitbelow = true      -- open horizontal splits below
-- vim.cmd.colorscheme('gruvbox')
-- vim.cmd.colorscheme('habamax')
-- vim.cmd.colorscheme('retrobox')
vim.cmd.colorscheme('tokyonight-storm')

-- Searching
vim.opt.incsearch = true       -- search as characters are entered
vim.opt.hlsearch = false       -- do not highlight matches
vim.opt.ignorecase = true      -- ignore case in search by default
vim.opt.smartcase = true       -- but make it case sensitive if an uppercase is there

local autocmd = vim.api.nvim_create_autocmd

-- Remembers the last position the cursor was at in a file
-- @returns a "clear = true" augroup
local function augroup(name) return vim.api.nvim_create_augroup('sergio-lazyvim_' .. name, { clear = true }) end
autocmd('BufReadPost', {
  group = augroup('restore_position'),
  callback = function()
    local exclude = { 'gitcommit' }
    local buf = vim.api.nvim_get_current_buf()
    if vim.tbl_contains(exclude, vim.bo[buf].filetype) then return end

    local mark = vim.api.nvim_buf_get_mark(buf, '"')
    local line_count = vim.api.nvim_buf_line_count(buf)
    if mark[1] > 0 and mark[1] <= line_count then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
      vim.api.nvim_feedkeys('zvzz', 'n', true)
    end
  end,
  desc = 'Restore cursor position after reopening file',
})

