local dap=require('dap')
dap.adapters.cdb = {
    {
	name = 'Launch',
	type = 'cdb',
	request = 'launch',
	program = function()
		return "C:\\Program Files (x86)\\Windows Kits\\10\\Debuggers\\x64\\cdb.exe"
	end,
	cwd='${workspaceFolder}',
	stopOnEntry=false,
	args={},
    }
}

