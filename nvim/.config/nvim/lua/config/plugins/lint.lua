local config = function()
    require("lint").linters_by_ft = {
        python = { "ruff" },
    }
    vim.api.nvim_create_autocmd({ "BufWritePost" }, {
        group = vim.api.nvim_create_augroup("nvim-lint", { clear = true }),
        callback = function()
            require("lint").try_lint()
        end,
    })
end

return {
    "mfussenegger/nvim-lint",
    config = config,
    dependencies = {
        "williamboman/mason.nvim",
    },
}
