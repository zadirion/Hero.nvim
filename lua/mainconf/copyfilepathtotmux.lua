function CopyToTmux(source)
    local shell_command = vim.g.uhshellprefix .. '\"tmux set-buffer \'' .. source .. '\'\"'
    local result = vim.fn.system(shell_command)
end

function CopyFilePathToTmux()
    local path = vim.fn.expand('%:p')
    vim.cmd("echo \'" .. path.."\'");
    CopyToTmux(path)
end

vim.api.nvim_command('command! UhPathToTmux lua CopyFilePathToTmux()')




function CopyBreakpointToTmux()
    local currentFilePath=vim.fn.expand('%:p')
    local currentFileName=vim.fn.expand('%:t')
    local row,col=unpack(vim.api.nvim_win_get_cursor(0))

    if vim.g.uhwsl then
        currentFilePath=vim.fn.system('bash -c "wslpath -u \'' .. currentFilePath .. '\'"')
    end

    local moduleName = vim.fn.system(vim.g.uhshellprefix .. '\"~/UnrealHeroCLI/getpathmodule '..currentFilePath..'\"')
    local configName = vim.fn.system(vim.g.uhshellprefix .. '\"~/UnrealHeroCLI/getconfigname\"')
    moduleName=string.gsub(moduleName, '\r','')
    configName=string.gsub(configName, '\r','')
    moduleName=string.gsub(moduleName, '\n','')
    configName=string.gsub(configName, '\n','')

    local bpstring='bp `UnrealEditor_'..moduleName..'_Win64_'..configName..'!'..currentFileName..':'..row..'`'
    vim.print('copied to tmux clipboard:' .. bpstring)
    CopyToTmux(bpstring)
end

vim.api.nvim_command('command! UhBpToTmux lua CopyBreakpointToTmux()')

