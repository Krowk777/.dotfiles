local config = function()
    require('oil').setup({
        skip_confirm_for_simple_edits = true,
        keymaps = {
            ["g?"] = { "actions.show_help", mode = "n" },
            ["<CR>"] = "actions.select",
            ["<C-v>"] = { "actions.select", opts = { vertical = true } },
            ["<C-s>"] = { "actions.select", opts = { horizontal = true } },
            ["<C-t>"] = { "actions.select", opts = { tab = true } },
            ["<C-p>"] = "actions.preview",
            ["<C-c>"] = { "actions.close", mode = "n" },
            ["<C-l>"] = "actions.refresh",
            ["-"] = { "actions.parent", mode = "n" },
            ["_"] = { "actions.open_cwd", mode = "n" },
            ["`"] = { "actions.cd", mode = "n" },
            ["~"] = { "actions.cd", opts = { scope = "tab" }, mode = "n" },
            ["gs"] = { "actions.change_sort", mode = "n" },
            ["gx"] = "actions.open_external",
            ["g."] = { "actions.toggle_hidden", mode = "n" },
            ["g\\"] = { "actions.toggle_trash", mode = "n" },
        },
        view_options = {
            show_hidden = true,
            is_hidden_file = function(name, bufnr)
                local m = name:match("^%.")
                return m ~= nil
            end,
            is_always_hidden = function(name, bufnr)
                return false
            end,
            natural_order = "fast",
            case_insensitive = false,
            sort = {
                { "type", "asc" },
                { "name", "asc" },
            },
            highlight_filename = function(entry, is_hidden, is_link_target,
                                          is_link_orphan)
                return nil
            end,
        },
    })
    vim.keymap.set('n', '-', '<cmd>Oil<CR>', { desc = 'go to file explorer' })
end

return {
    'stevearc/oil.nvim',
    config = config,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    lazy = false,
}
