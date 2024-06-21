require("cf913")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct
vim.g.maplocalleader = "\\" -- Same for `maplocalleader`

require("lazy").setup({
  { 'nvim-telescope/telescope.nvim', tag = '0.1.6',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  { 'folke/tokyonight.nvim' },
  { 'j-hui/fidget.nvim', opts = {}},
  { 'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
  { 'williamboman/mason.nvim'},
  { 'williamboman/mason-lspconfig.nvim'},
  { 'neovim/nvim-lspconfig'},
  { 'hrsh7th/nvim-cmp'},
  { 'hrsh7th/cmp-nvim-lsp'},
  { 'nvim-treesitter/nvim-treesitter'},
  { 'L3MON4D3/LuaSnip'},
  { "rose-pine/neovim", name = "rose-pine" },
  -- { "nvim-tree/nvim-tree.lua",
  --   version = "*",
  --   lazy = false,
  --   dependencies = {
  --     "nvim-tree/nvim-web-devicons",
  --   },
  --   config = function()
  --     require("nvim-tree").setup {}
  --   end
  -- },
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = true
    -- use opts = {} for passing setup options
    -- this is equalent to setup({}) function
  },
  {'prettier/vim-prettier'},
  { "karb94/neoscroll.nvim",
    config = function ()
      require('neoscroll').setup({})
    end
  },
 { 'echasnovski/mini.map', version = false },
})

require('mini.map').setup()






