local find_files = function(dir)
    local builtin = require("telescope.builtin")
    builtin.find_files({ cwd = dir })
end

local function get_fd_cmd()
    if vim.fn.executable("fd") == 1 then
        return "fd"
    elseif vim.fn.executable("fdfind") == 1 then
        return "fdfind"
    end
    return nil
end

local find_dirs = function()
    local fd_cmd = get_fd_cmd()
    if not fd_cmd then
        print("[error] 'fd' or 'fdfind' not found in PATH")
        return
    end

    local output = vim.fn.system({
        fd_cmd,
        "--exclude",
        ".git",
        "-H",
        "--type",
        "d",
    })
    if vim.v.shell_error ~= 0 then
        print("[error] " .. output)
        return
    end
    local file_paths = vim.split(output, "\n", { trimempty = true })

    local pickers = require("telescope.pickers")
    local finders = require("telescope.finders")
    local conf = require("telescope.config").values
    pickers
        .new({}, {
            prompt_title = "Search Directories",
            finder = finders.new_table({
                results = file_paths,
                entry_maker = function(entry)
                    return {
                        value = entry,
                        display = " " .. entry:gsub("^./", ""),
                        ordinal = entry,
                    }
                end,
            }),
            sorter = conf.generic_sorter({}),
        })
        :find()
end

local config = function()
    require("telescope").setup({
        extensions = {
            fzf = {},
        },
    })
    require("telescope").load_extension("fzf")

    local builtin = require("telescope.builtin")

    vim.keymap.set("n", "<Leader>sf", function()
        builtin.git_files({ show_untracked = true, hidden = true })
    end, { desc = "[s]earch [f]iles" })
    vim.keymap.set(
        "n",
        "<Leader>s.",
        builtin.oldfiles,
        { desc = "[s]earch recent files" }
    )
    vim.keymap.set("n", "<Leader>sc", function()
        find_files(vim.fn.stdpath("config"))
    end, { desc = "[s]earch [c]onfig" })
    vim.keymap.set(
        "n",
        "<Leader>se",
        builtin.diagnostics,
        { desc = "[s]earch diagnostics" }
    )
    vim.keymap.set(
        "n",
        "<Leader>st",
        builtin.builtin,
        { desc = "[s]earch [t]elescope builtins" }
    )
    vim.keymap.set(
        "n",
        "<Leader>sd",
        find_dirs,
        { desc = "[s]earch [d]irectories" }
    )
    vim.keymap.set(
        "n",
        "<Leader>sb",
        builtin.buffers,
        { desc = "[s]earch [b]uffers" }
    )
    vim.keymap.set("n", "<Leader>sa", function()
        builtin.find_files({
            hidden = true,
            no_ignore = true,
            file_ignore_patterns = { "%.git/" },
        })
    end, { desc = "[s]earch [a]ll files" })
    vim.keymap.set("n", "<Leader>sl", function()
        builtin.live_grep({
            additional_args = { "--hidden" },
        })
    end, { desc = "[s]earch by [l]ive grep" })
end

local dependencies = {
    "nvim-lua/plenary.nvim",
    {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
    },
}

return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = dependencies,
    config = config,
}
