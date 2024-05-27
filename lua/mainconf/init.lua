-- bootstrap packer
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
	execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
end

execute 'packadd packer.nvim'

require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'

	if packer_bootstrap then
		require('packer').sync()
	end
end)


-- load unrealhero config
local configFilePath = vim.fn.expand("~") .. "/unrealhero_init.lua";
local file = io.open(configFilePath, "r")
if file then
    io.close(file)
    dofile(configFilePath)
end
vim.api.nvim_create_user_command("UnrealHero", function(opts)
    vim.cmd("vs " .. configFilePath) 
end, {})

-- globals
vim.g.UltiSnipsExpandTrigger = "<tab>"
vim.g.UltiSnipsJumpOrExpandTrigger = "<tab>"
vim.g.UltiSnipsJumpForwardTrigger = "<c-b>"
vim.g.UltiSnipsJumpBackwardTrigger = "<S-Tab>"
vim.g.UltiSnipsEditSplit = "vertical"
vim.g.vimwiki_folding = "syntax"
-- end globals
require("mainconf.packer")
require("mainconf.packer_getcommit")
require("mainconf.remap")
require("mainconf.set")
require("mainconf.scrollfontsize")

