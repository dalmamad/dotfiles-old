local fn = vim.fn
-- Automatically install packerplug
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  print("Installing packer close and reopen Neovim...")
  vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
-- vim.cmd([[
--    augroup packer_user_config
--      autocmd!
--      autocmd BufWritePost plugins.lua source <afile> | PackerSync
--    augroup end
--  ]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
-- NOTE: compile_path and package_root dir must be match with runtimepath
packer.init({
  compile_path = fn.stdpath("data") .. "/site/plugin/packer_compiled.lua",
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
})

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use({ "wbthomason/packer.nvim", commit = "dac4088c70f4337c6c40d1a2751266a324765797" }) -- Have packer manage itself
  use({ "nvim-tree/nvim-web-devicons", commit = "05e1072f63f6c194ac6e867b567e6b437d3d4622" })
  use({ "nvim-lua/plenary.nvim", commit = "968a4b9afec0c633bc369662e78f8c5db0eba249" }) -- Useful lua functions used by lots of plugins
  use({
    "akinsho/toggleterm.nvim",
    config = function()
      require("configs.toggleterm")
    end,
  })
  use({
    "folke/which-key.nvim",
    commit = "61553aeb3d5ca8c11eea8be6eadf478062982ac9",
    config = function()
      require("configs.whichkey")
    end,
  })
  use({ "moll/vim-bbye", commit = "25ef93ac5a87526111f43e5110675032dbcacf56" })
  use({
    "akinsho/bufferline.nvim",
    commit = "c7492a76ce8218e3335f027af44930576b561013",
    config = function()
      require("configs.bufferline")
    end,
  })
  use({
    "lewis6991/impatient.nvim",
    commit = "d3dd30ff0b811756e735eb9020609fa315bfbbcc",
    config = function()
      require("configs.impatient")
    end,
  })
  use({
    "nvim-lualine/lualine.nvim",
    commit = "bfa0d99ba6f98d077dd91779841f1c88b7b5c165",
    -- requires = { "nvim-tree/nvim-web-devicons", opt = true },
    config = function()
      require("configs.lualine")
    end,
  })
  -- Colorschemes
  use({ "folke/tokyonight.nvim", commit = "ecae454c303d5190fb0ded096205a99fae16c6d4" })
  use({ "lunarvim/darkplus.nvim", commit = "d308e9538f0e50cc3e80afc4ed904ab8b8e10fe6" })
  use({ "nyoom-engineering/oxocarbon.nvim", commit = "749562ce8ffbcc5c4f69ec0dab4f4cdd0a8d2e47" })
  use({ "luisiacc/gruvbox-baby", commit = "309b405d64af29126b1eb8d9be2f280ee2aec15d" })
  use({ "Shatur/neovim-ayu", commit = "5af91fe1176e764f7706b11b43793f31635e9520" })

  use({
    "goolord/alpha-nvim",
    config = function()
      require("configs.alpha")
    end,
  })
  use({
    "ahmedkhalf/project.nvim",
    config = function()
      require("configs.project")
    end,
  })

  -- cmp plugins
  use({
    "hrsh7th/nvim-cmp",
    commit = "df6734aa018d6feb4d76ba6bda94b1aeac2b378a",
    config = function()
      require("configs.cmp")
    end,
  }) -- The completion plugin
  use({ "hrsh7th/cmp-buffer", commit = "62fc67a2b0205136bc3e312664624ba2ab4a9323" }) -- buffer completions
  use({ "hrsh7th/cmp-path", commit = "466b6b8270f7ba89abd59f402c73f63c7331ff6e" }) -- path completions
  use({ "saadparwaiz1/cmp_luasnip", commit = "a9de941bcbda508d0a45d28ae366bb3f08db2e36" }) -- snippet completions
  use({ "hrsh7th/cmp-nvim-lsp", commit = "affe808a5c56b71630f17aa7c38e15c59fd648a8" })
  use({ "hrsh7th/cmp-nvim-lua", commit = "d276254e7198ab7d00f117e88e223b4bd8c02d21" })

  -- snippets
  use({ "L3MON4D3/LuaSnip", commit = "79b2019c68a2ff5ae4d732d50746c901dd45603a", }) --snippet engine
  use({ "rafamadriz/friendly-snippets", commit = "d27a83a363e61009278b6598703a763ce9c8e617" }) -- a bunch of snippets to use

  -- LSP
  use({
    "neovim/nvim-lspconfig",
    commit = "e96f639b608a596aa1ea8abb7e5b799cedbb0b1a",
    config = function()
      require("configs.lsp")
    end,
  }) -- enable LSP
  use({
    "jose-elias-alvarez/null-ls.nvim",
    commit = "b3d2ebdb75cf1fa4290822b43dc31f61bd0023f8",
    config = function()
      require("configs.null-ls")
    end,
  }) -- for formatters and linters
  use({
    "williamboman/mason.nvim",
    commit = "2381f507189e3e10a43c3932a3ec6c2847180abc",
    config = function()
      require("configs.mason")
    end,
  })
  use({
    "williamboman/mason-lspconfig.nvim",
    commit = "4674ed145fd0e72c9bfdb32b647f968b221bf2f2",
    config = function()
      require("configs.mason-lspconfig")
    end,
  })
  -- Telescope
  use({
    "nvim-telescope/telescope.nvim",
    commit = "d96eaa914aab6cfc4adccb34af421bdd496468b0",
    config = function()
      require("configs.telescope")
    end,
  })

  -- Treesitter
  use({
    "nvim-treesitter/nvim-treesitter",
    -- commit = "4953fdf73ef5ada18e1e969019803605f4f4a4ac",
    run = function()
      local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
      ts_update()
    end,
    config = function()
      require("configs.treesitter")
    end,
  })

  -- Autopairs
  use({
    "windwp/nvim-autopairs",
    commit = "fa6876f832ea1b71801c4e481d8feca9a36215ec",
    config = function()
      require("configs.autopairs")
    end,
  }) -- Autopairs, integrates with both cmp and treesitter

  -- Comment
  use({
    "numToStr/Comment.nvim",
    commit = "5f01c1a89adafc52bf34e3bf690f80d9d726715d",
    config = function()
      require("configs.comment")
    end,
  })

  -- File Explorer
  use({
    "dalmamad/nvim-tree.lua",
    commit = "fcdec7d186aee8ed39ef79c87666c1401f6a4d48",
    -- requires = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("configs.nvim-tree")
    end,
  })
  -- Git
  use({
    "lewis6991/gitsigns.nvim",
    commit = "d076301a634198e0ae3efee3b298fc63c055a871",
    config = function()
      require("configs.gitsigns")
    end,
  })
  -- git conflict
  use {'akinsho/git-conflict.nvim', tag = "*", config = function()
    require('configs.git-conflict')
  end}
  -- use { "mfussenegger/nvim-dap" }

  --Notes
  use({
    "folke/todo-comments.nvim",
    commit = "1b9df577262b2c4c4ea422161742927f80ffa131",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("configs.todo-comments")
    end,
  })

  use { 'CRAG666/code_runner.nvim', requires = 'nvim-lua/plenary.nvim',
    config = function()
      require("configs.code-runner")
    end,
  }

  -- use({
  --   "nvim-neorg/neorg",
  --   run = ":Neorg sync-parsers", -- This is the important bit!
  --   config = function()
  --     require("configs.neorg")
  --   end,
  -- })
  -- use {"nvim-neorg/neorg-telescope"}

  use({
    "epwalsh/obsidian.nvim",
    config = function()
      require("configs.obsidian")
    end,
  })

  -- Notify
  -- use({
  --   "rcarriga/nvim-notify",
  --   config = function()
  --     require("configs.notify")
  --   end,
  -- })

  --Debug
  use({
    "dalmamad/debugprint.nvim",
    branch = 'dalmamad',
    config = function()
      require("configs.debugprint")
    end,
  })

  -- Window
  use({
    "anuvyklack/windows.nvim",
    requires = {
      "anuvyklack/middleclass",
      "anuvyklack/animation.nvim",
    },
    config = function()
      require("configs.windows")
    end,
  })

  -- Motions
  use({
    "phaazon/hop.nvim",
    branch = "v2", -- optional but strongly recommended
    config = function()
      require("configs.hop")
    end,
  })

  -- Rest
  use {
  "rest-nvim/rest.nvim",
  requires = { "nvim-lua/plenary.nvim" },
  config = function()
      require("configs.rest")
  end
}

  -- Sudo
  use({
    "lambdalisue/suda.vim",
  })


  use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
})

  -- temp
  -- use { "nvim-telescope/telescope-file-browser.nvim" }
  -- use("eandrju/cellular-automaton.nvim")
  -- use("alec-gibson/nvim-tetris")
  -- use("ggandor/lightspeed.nvim")
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins

  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
