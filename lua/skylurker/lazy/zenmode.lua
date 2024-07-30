-- https://github.com/folke/zen-mode.nvim
return {
    "folke/zen-mode.nvim",
    name = 'zen-mode',
    config = function()
        local zen_mode = require("zen-mode")

        zen_mode.setup({
            window = {
                width = 100,
               options = {},
            },
            on_open = function()
                vim.wo.wrap = false
                vim.wo.number = false
                vim.wo.relativenumber = false
            end,
            on_close = function()
                vim.wo.wrap = true
                vim.wo.number = true
                vim.wo.relativenumber = true
            end,
        })

        vim.keymap.set("n", "<leader>zz", zen_mode.toggle)
    end,
}
