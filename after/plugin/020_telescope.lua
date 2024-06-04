require('telescope').setup {
    pickers = {
        live_grep = {
            mappings = {
                i = { 
                    ["<c-f>"] = require('telescope.actions').to_fuzzy_refine ,
                    -- refine the search, basically feed it back into telescope
                    ["<c-r>"] = {
                        function(p_bufnr)
                            -- send results to quick fix list
                            require("telescope.actions").send_to_qflist(p_bufnr)
                            local qflist = vim.fn.getqflist()
                            local paths = {}
                            local hash = {}
                            for k in pairs(qflist) do
                                local path = vim.fn.bufname(qflist[k]["bufnr"]) -- extract path from quick fix list
                                if not hash[path] then -- add to paths table, if not already appeared
                                    paths[#paths + 1] = path
                                    hash[path] = true -- remember existing paths
                                end
                            end
                            -- show search scope with message
                            vim.notify("find in ...\n  " .. table.concat(paths, "\n  "))
                            -- execute live_grep_args with search scope
                            require("telescope").extensions.live_grep_args.live_grep_args({ search_dirs = paths })
                        end,
                        type = "action",
                        opts = {
                            nowait = true,
                            silent = true,
                            desc = "Live grep on results",
                        },
                    },
                },
            },
        },
    },
}

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fd', builtin.diagnostics, {})
--vim.keymap.set('n', '<Leader>fs', builtin.treesitter, {})
-- vim.keymap.set('n', '<Leader>fs', builtin.lsp_document_symbols, {})

-- find document symbols eitheir through lsp if available
-- otherwise fallback to treesitter
vim.keymap.set('n', '<leader>fs', function (opts)
  local bufnr = vim.api.nvim_get_current_buf()
  local winnr = vim.api.nvim_get_current_win()
  local params = vim.lsp.util.make_position_params(winnr)
  vim.lsp.buf_request(bufnr,
    "textDocument/documentSymbol", params,
    function(err, result, _, _)
        if err then
            return builtin.treesitter()
        end
        return builtin.lsp_document_symbols()
    end)
end, {})

vim.keymap.set('n', '<leader>fws', builtin.lsp_workspace_symbols, {})
vim.keymap.set('n', '<leader>gf', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({search = vim.fn.input("Grep > ")});
end)
