local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]


return require('packer').startup(function(use)
  -- Packer can manage itself
  use { 'wbthomason/packer.nvim'}
  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.4',
	  -- or                            , branch = '0.1.x',
      requires = {
          { 'nvim-lua/plenary.nvim', commit="50012918b2fc8357b87cff2a7f7f0446e47da174"},
          { 'BurntSushi/ripgrep'},
          { 'nvim-telescope/telescope-live-grep-args.nvim'}
      }
  }

  use {
          'nvim-treesitter/nvim-treesitter',
          tag = 'v0.9.2',
          run = function()
        	  local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
        	  ts_update()
          end,
          }

  use { 'nvim-treesitter/playground'}
  use { 'ThePrimeagen/harpoon'}
  use { 'ThePrimeagen/refactoring.nvim',
    requires = {
        {"nvim-lua/plenary.nvim"},
        {"nvim-treesitter/nvim-treesitter"}
    }
  }
  use { 'mbbill/undotree'}
  use { 'kikito/inspect.lua'}
  use {
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v3.x',
	  requires = {
		  --- Uncomment these if you want to manage LSP servers from neovim
		  {'williamboman/mason.nvim'},
		  {'williamboman/mason-lspconfig.nvim'},

		  -- LSP Support
		  {'neovim/nvim-lspconfig'},
		  -- Autocompletion
          {
              'hrsh7th/nvim-cmp', 
              requires = {
                  "quangnguyen30192/cmp-nvim-ultisnips",
                  config = function()
                      -- optional call to setup (see customization section)
                      require("cmp_nvim_ultisnips").setup{}
                  end,
                  -- If you want to enable filetype detection based on treesitter:
                  -- requires = { "nvim-treesitter/nvim-treesitter" },
              },
              config = function()
                  local cmp_ultisnips_mappings = require("cmp_nvim_ultisnips.mappings")
                  local cmp = require("cmp")
                  require("cmp").setup({
                      snippet = {
                          expand = function(args)
                              vim.fn["UltiSnips#Anon"](args.body)
                          end,
                      },
                      sources = {
                          { name = "ultisnips" },
                          -- more sources
                      },
                      -- recommended configuration for <Tab> people:
                      mapping = {
                          ["<Tab>"] = cmp.mapping(
                          function(fallback)
                              cmp_ultisnips_mappings.expand_or_jump_forwards(fallback)
                          end,
                          { "i", "s", --[[ "c" (to enable the mapping in command mode) ]] }
                          ),
                          ["<S-Tab>"] = cmp.mapping(
                          function(fallback)
                              cmp_ultisnips_mappings.jump_backwards(fallback)
                          end,
                          { "i", "s", --[[ "c" (to enable the mapping in command mode) ]] }
                          ),
                      },
                  })
              end,
          },
		  {'hrsh7th/cmp-nvim-lsp', commit="44b16d11215dce86f253ce0c30949813c0a90765"},
		  {'L3MON4D3/LuaSnip', commit="0df29db3543837f8b41597f2640397c5ec792b7b"},
		  {'tpope/vim-fugitive', commit="cbe9dfa162c178946afa689dd3f42d4ea8bf89c1"},
          {'tpope/vim-dispatch', commit="6cc2691576f97d43f8751664d1a1a908b99927e5"},
	  }
  }

  use {
      requires = { "nvim-treesitter/nvim-treesitter" },
      "Badhi/nvim-treesitter-cpp-tools",
  }

  use {
      'SirVer/ultisnips'
  }

  use {
      'nvim-lualine/lualine.nvim',
      requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }

  use { "ggandor/leap.nvim" }

  -- themes
  use { 'rose-pine/neovim' }
  use { "nonetallt/vim-neon-dark" }
  use { "folke/tokyonight.nvim" }
  use { "tomasr/molokai" }
  use { "Reewr/vim-monokai-phoenix" }
  use { "bluz71/vim-nightfly-colors" }
  use { "Rigellute/shades-of-purple.vim" }
  use { "hachy/eva01.vim" }
  use { "senran101604/neotrix.vim" }
  use { "mfussenegger/nvim-dap" }

  -- this is my personal fork that fixes vimwiki link generation 
  -- when using markdown
  use { "zadirion/vimwiki" }

  vim.g.vimwiki_list = {
      {
          path = '~/vimwikimd',
          syntax = 'markdown',
          ext = 'md',
          links_space_char = '_'
      }
  }

  -- My plugin, always latest commit
  use {'zadirion/Unreal.nvim',
    requires =
    {
        {"tpope/vim-dispatch"}
    }
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)

