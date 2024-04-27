-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/userland/.cache/nvim/packer_hererocks/2.1.1692716794/share/lua/5.1/?.lua;/home/userland/.cache/nvim/packer_hererocks/2.1.1692716794/share/lua/5.1/?/init.lua;/home/userland/.cache/nvim/packer_hererocks/2.1.1692716794/lib/luarocks/rocks-5.1/?.lua;/home/userland/.cache/nvim/packer_hererocks/2.1.1692716794/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/userland/.cache/nvim/packer_hererocks/2.1.1692716794/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  LuaSnip = {
    loaded = true,
    path = "/home/userland/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["Unreal.nvim"] = {
    loaded = true,
    path = "/home/userland/.local/share/nvim/site/pack/packer/start/Unreal.nvim",
    url = "https://github.com/zadirion/Unreal.nvim"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/userland/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-ultisnips"] = {
    config = { "\27LJ\2\nD\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\23cmp_nvim_ultisnips\frequire\0" },
    loaded = true,
    path = "/home/userland/.local/share/nvim/site/pack/packer/start/cmp-nvim-ultisnips",
    url = "https://github.com/quangnguyen30192/cmp-nvim-ultisnips"
  },
  ["eva01.vim"] = {
    loaded = true,
    path = "/home/userland/.local/share/nvim/site/pack/packer/start/eva01.vim",
    url = "https://github.com/hachy/eva01.vim"
  },
  harpoon = {
    loaded = true,
    path = "/home/userland/.local/share/nvim/site/pack/packer/start/harpoon",
    url = "https://github.com/ThePrimeagen/harpoon"
  },
  ["inspect.lua"] = {
    loaded = true,
    path = "/home/userland/.local/share/nvim/site/pack/packer/start/inspect.lua",
    url = "https://github.com/kikito/inspect.lua"
  },
  ["leap.nvim"] = {
    loaded = true,
    path = "/home/userland/.local/share/nvim/site/pack/packer/start/leap.nvim",
    url = "https://github.com/ggandor/leap.nvim"
  },
  ["lsp-zero.nvim"] = {
    loaded = true,
    path = "/home/userland/.local/share/nvim/site/pack/packer/start/lsp-zero.nvim",
    url = "https://github.com/VonHeikemen/lsp-zero.nvim"
  },
  ["lualine.nvim"] = {
    loaded = true,
    path = "/home/userland/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    loaded = true,
    path = "/home/userland/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason.nvim"] = {
    loaded = true,
    path = "/home/userland/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  molokai = {
    loaded = true,
    path = "/home/userland/.local/share/nvim/site/pack/packer/start/molokai",
    url = "https://github.com/tomasr/molokai"
  },
  ["neotrix.vim"] = {
    loaded = true,
    path = "/home/userland/.local/share/nvim/site/pack/packer/start/neotrix.vim",
    url = "https://github.com/senran101604/neotrix.vim"
  },
  neovim = {
    loaded = true,
    path = "/home/userland/.local/share/nvim/site/pack/packer/start/neovim",
    url = "https://github.com/rose-pine/neovim"
  },
  ["nvim-cmp"] = {
    config = { "\27LJ\2\n:\0\1\4\0\4\0\0066\1\0\0009\1\1\0019\1\2\0019\3\3\0B\1\2\1K\0\1\0\tbody\19UltiSnips#Anon\afn\bvim5\0\1\4\1\1\0\5-\1\0\0009\1\0\1\18\3\0\0B\1\2\1K\0\1\0\0À\28expand_or_jump_forwards,\0\1\4\1\1\0\5-\1\0\0009\1\0\1\18\3\0\0B\1\2\1K\0\1\0\0À\19jump_backwards˜\2\1\0\n\0\19\0\"6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0026\2\0\0'\4\2\0B\2\2\0029\2\3\0025\4\a\0005\5\5\0003\6\4\0=\6\6\5=\5\b\0044\5\3\0005\6\t\0>\6\1\5=\5\n\0045\5\14\0009\6\v\0013\b\f\0005\t\r\0B\6\3\2=\6\15\0059\6\v\0013\b\16\0005\t\17\0B\6\3\2=\6\18\5=\5\v\4B\2\2\0012\0\0€K\0\1\0\f<S-Tab>\1\3\0\0\6i\6s\0\n<Tab>\1\0\0\1\3\0\0\6i\6s\0\fmapping\fsources\1\0\1\tname\14ultisnips\fsnippet\1\0\0\vexpand\1\0\0\0\nsetup\bcmp cmp_nvim_ultisnips.mappings\frequire\0" },
    loaded = true,
    path = "/home/userland/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/userland/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/userland/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-cpp-tools"] = {
    loaded = true,
    path = "/home/userland/.local/share/nvim/site/pack/packer/start/nvim-treesitter-cpp-tools",
    url = "https://github.com/Badhi/nvim-treesitter-cpp-tools"
  },
  ["nvim-web-devicons"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/userland/.local/share/nvim/site/pack/packer/opt/nvim-web-devicons",
    url = "https://github.com/nvim-tree/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/userland/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  playground = {
    loaded = true,
    path = "/home/userland/.local/share/nvim/site/pack/packer/start/playground",
    url = "https://github.com/nvim-treesitter/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/userland/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["refactoring.nvim"] = {
    loaded = true,
    path = "/home/userland/.local/share/nvim/site/pack/packer/start/refactoring.nvim",
    url = "https://github.com/ThePrimeagen/refactoring.nvim"
  },
  ripgrep = {
    loaded = true,
    path = "/home/userland/.local/share/nvim/site/pack/packer/start/ripgrep",
    url = "https://github.com/BurntSushi/ripgrep"
  },
  ["shades-of-purple.vim"] = {
    loaded = true,
    path = "/home/userland/.local/share/nvim/site/pack/packer/start/shades-of-purple.vim",
    url = "https://github.com/Rigellute/shades-of-purple.vim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/userland/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["tokyonight.nvim"] = {
    loaded = true,
    path = "/home/userland/.local/share/nvim/site/pack/packer/start/tokyonight.nvim",
    url = "https://github.com/folke/tokyonight.nvim"
  },
  ultisnips = {
    loaded = true,
    path = "/home/userland/.local/share/nvim/site/pack/packer/start/ultisnips",
    url = "https://github.com/SirVer/ultisnips"
  },
  undotree = {
    loaded = true,
    path = "/home/userland/.local/share/nvim/site/pack/packer/start/undotree",
    url = "https://github.com/mbbill/undotree"
  },
  ["vim-dispatch"] = {
    loaded = true,
    path = "/home/userland/.local/share/nvim/site/pack/packer/start/vim-dispatch",
    url = "https://github.com/tpope/vim-dispatch"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/userland/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-monokai-phoenix"] = {
    loaded = true,
    path = "/home/userland/.local/share/nvim/site/pack/packer/start/vim-monokai-phoenix",
    url = "https://github.com/Reewr/vim-monokai-phoenix"
  },
  ["vim-neon-dark"] = {
    loaded = true,
    path = "/home/userland/.local/share/nvim/site/pack/packer/start/vim-neon-dark",
    url = "https://github.com/nonetallt/vim-neon-dark"
  },
  ["vim-nightfly-colors"] = {
    loaded = true,
    path = "/home/userland/.local/share/nvim/site/pack/packer/start/vim-nightfly-colors",
    url = "https://github.com/bluz71/vim-nightfly-colors"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: cmp-nvim-ultisnips
time([[Config for cmp-nvim-ultisnips]], true)
try_loadstring("\27LJ\2\nD\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\23cmp_nvim_ultisnips\frequire\0", "config", "cmp-nvim-ultisnips")
time([[Config for cmp-nvim-ultisnips]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\2\n:\0\1\4\0\4\0\0066\1\0\0009\1\1\0019\1\2\0019\3\3\0B\1\2\1K\0\1\0\tbody\19UltiSnips#Anon\afn\bvim5\0\1\4\1\1\0\5-\1\0\0009\1\0\1\18\3\0\0B\1\2\1K\0\1\0\0À\28expand_or_jump_forwards,\0\1\4\1\1\0\5-\1\0\0009\1\0\1\18\3\0\0B\1\2\1K\0\1\0\0À\19jump_backwards˜\2\1\0\n\0\19\0\"6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0026\2\0\0'\4\2\0B\2\2\0029\2\3\0025\4\a\0005\5\5\0003\6\4\0=\6\6\5=\5\b\0044\5\3\0005\6\t\0>\6\1\5=\5\n\0045\5\14\0009\6\v\0013\b\f\0005\t\r\0B\6\3\2=\6\15\0059\6\v\0013\b\16\0005\t\17\0B\6\3\2=\6\18\5=\5\v\4B\2\2\0012\0\0€K\0\1\0\f<S-Tab>\1\3\0\0\6i\6s\0\n<Tab>\1\0\0\1\3\0\0\6i\6s\0\fmapping\fsources\1\0\1\tname\14ultisnips\fsnippet\1\0\0\vexpand\1\0\0\0\nsetup\bcmp cmp_nvim_ultisnips.mappings\frequire\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
