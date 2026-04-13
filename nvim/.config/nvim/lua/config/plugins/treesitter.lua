local config = function()
    require("nvim-treesitter").install({
        "c",
        "cpp",
        "c_sharp",
        "lua",
        "python",
        "bash",
        "markdown",
        "markdown_inline",
        "go",
        "java",
        "javascript",
        "typescript",
        "terraform",
        "html",
        "css",
        "json",
        "yaml",
        "toml",
        "gitignore",
    })
end

return {
    "nvim-treesitter/nvim-treesitter",
    name = "nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
    config = config,
}
