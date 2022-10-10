-- Plugins
vim.cmd [[packadd packer.nvim]]
return require('packer').startup(function(use)

  -- 需要依赖
  use 'wbthomason/packer.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'kyazdani42/nvim-web-devicons'

  -- Fold tree
  use {
    'nvim-tree/nvim-tree.lua',
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }

  -- bufferline
  use {
    'akinsho/bufferline.nvim'
  }
  use 'moll/vim-bbye' -- for more sensible delete buffer cmd

  -- language
  use 'nvim-treesitter/nvim-treesitter'

  -- Themes
  use 'projekt0n/github-nvim-theme'

  -- git
  use {
    'lewis6991/gitsigns.nvim',
    tag = 'release'
  }

  -- status line
  use {
    'nvim-lualine/lualine.nvim'
  }

  -- floating terminal
  use {
    "akinsho/toggleterm.nvim"
  }

  -- 文件查找
  use {
    'nvim-telescope/telescope.nvim'
  }

  -- indent guide
  use "lukas-reineke/indent-blankline.nvim"

  -- which-key
  use "folke/which-key.nvim"

  use 'goolord/alpha-nvim'

  use "lukas-reineke/lsp-format.nvim"
  use 'windwp/nvim-spectre'

  use {
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  }


  use 'windwp/nvim-ts-autotag'
  use 'tpope/vim-surround'
  -- use {
  --   'numToStr/Comment.nvim',
  --   config = function()
  --     require('Comment').setup()
  --   end
  -- }
  use {
    'phaazon/hop.nvim',
    branch = 'v2',
  }
  use 'p00f/nvim-ts-rainbow'
  use 'glepnir/dashboard-nvim'
end)
