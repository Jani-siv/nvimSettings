-- Start of lua programming
-- <leader> Leader key
-- <CR> enter key
-- define leader key
vim.g.mapleader = '-'

-- Line numbering
vim.o.number = true

-- set tab to 4 spaces
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

-- syntax highlight
vim.cmd('syntax on')

-- Set color scheme
vim.cmd('colorscheme desert')

local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')
-- nerdtree for travelling
Plug('preservim/nerdtree', { ['on'] = 'NERDTreeToggle' })
-- nvim-cmp completion plugins
Plug('hrsh7th/nvim-cmp')
Plug('hrsh7th/cmp-nvim-lsp')
Plug('hrsh7th/cmp-buffer')
Plug('hrsh7th/cmp-path')
Plug('hrsh7th/cmp-cmdline')
Plug('hrsh7th/vim-vsnip')  -- For snippet completion
-- LSP configuration
Plug('neovim/nvim-lspconfig')  -- Enables LSP
vim.call('plug#end')
-- Set lua path .config/nvim/lua
package.path = package.path .. ';' .. vim.fn.stdpath('config') .. '/lua/?.lua'
-- Source LSP and completion setup from external Lua file
require('lsp_config')  -- This loads the configuration from the separate file

-- Key mapping for NERDTree
vim.api.nvim_set_keymap('n', 'TT', ':NERDTreeToggle<CR>', { noremap = true, silent = true })

-- source init.lua
vim.api.nvim_set_keymap('n', '<leader>sv', ':source ~/.config/nvim/init.lua<CR>', {noremap = true, silent = true})

-- open init.lua left split
vim.api.nvim_set_keymap('n', '<leader>ev', ':vsplit ~/.config/nvim/init.lua<CR>', {noremap = true, silent = true})


