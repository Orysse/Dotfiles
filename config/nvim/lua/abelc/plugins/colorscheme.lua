return {
    -- gruvbox
    {
        "ellisonleao/gruvbox.nvim",
        priority = 1000 ,
        config = true,
    },

    -- tokyonight
    {
        "folke/tokyonight.nvim",
        priority = 1000,
        opts = { style = "moon" },
    },

    -- catppuccin
    {
        "catppuccin/nvim",
        priority = 1000,
        opts = {
            integrations = {
                alpha = true,
                cmp = true,
                mason = true,
                native_lsp = {
                    enabled = true,
                    underlines = {
                        errors = { "undercurl" },
                        hints = { "undercurl" },
                        warnings = { "undercurl" },
                        information = { "undercurl" },
                    },
                },
                notify = true,
                telescope = true,
                treesitter = true,
            },
        },
        config = function()
            vim.cmd([[colorscheme catppuccin]])
    end,
    },


}
