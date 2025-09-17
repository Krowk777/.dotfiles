local config = function()
    require("conform").setup({
        default_format_opts = {
            lsp_format = "fallback",
        },
        format_on_save = {
            timeout_ms = 800,
            lsp_format = "fallback",
        },
        formatters_by_ft = {
            sh = { "shfmt" },
            python = {
                "ruff_fix",
                "ruff_format",
                "ruff_organize_imports",
            },
            lua = { "stylua" },
            javascript = { "prettier" },
            typescript = { "prettier" },
            html = { "prettier" },
            css = { "prettier" },
            scss = { "prettier" },
            less = { "prettier" },
            json = { "prettier" },
            yaml = { "prettier" },
            markdown = { "prettier" },
            kdl = { "kdlfmt" },
        },
    })
end

return {
    "stevearc/conform.nvim",
    config = config,
    dependencies = {
        "williamboman/mason.nvim",
    },
}
