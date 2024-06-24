require("cf913")

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

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
  { 'folke/tokyonight.nvim', 
 lazy = false,
  priority = 1000,
  opts = {
    transparent = true,
    style = 'night',
    styles = {
      sidebars = "transparent",
      floats = "transparent",
    },
    on_colors = function(colors)
      colors.bg_statusline = colors.none -- To check if its working try something like "#ff00ff" instead of colors.none
    end,
  },
},
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
  { "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("nvim-tree").setup {}
    end
  },
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
  {'petertriho/nvim-scrollbar'},
  {'norcalli/nvim-colorizer.lua'},
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  },
  {'lewis6991/gitsigns.nvim'},
  {'akinsho/toggleterm.nvim', version = "*", config = true},
  {
    'numToStr/Comment.nvim',
    opts = {
        -- add any options here
    }
  },
  -- {
  --   'nvim-lualine/lualine.nvim',
  --   dependencies = { 'nvim-tree/nvim-web-devicons' }
  -- },
  {
    "luckasRanarison/tailwind-tools.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    opts = {} -- your configuration
  },
   {
      "supermaven-inc/supermaven-nvim",
      config = function()
        require("supermaven-nvim").setup({})
      end,
    },
    {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig"},
    lazy = true,
    
  },
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" }
  }
})

vim.cmd[[colorscheme tokyonight]]

require("tailwind-tools").setup({
  -- your configuration
})

-- require('lualine').setup({
--   color = { bg = 'transparent'},
-- })
require('Comment').setup()

local colors = require("tokyonight.colors").setup()
require("scrollbar").setup({
   handle = {
        color = colors.bg_highlight,
    },
    marks = {
        Search = { color = colors.orange },
        Error = { color = colors.error },
        Warn = { color = colors.warning },
        Info = { color = colors.info },
        Hint = { color = colors.hint },
        Misc = { color = colors.purple },
    }
})
require('colorizer').setup()
require('gitsigns').setup()
require("toggleterm").setup({
  open_mapping = [[<leader>`]],
  insert_mappings = false,
  direction = 'float'
})

vim.g.markdown_fenced_languages = {
  "ts=typescript"
}






