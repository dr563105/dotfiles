-- Quarto bindings
config = function()
    local otter = require("otter.config")
    otter.setup{}
end

local quarto = require("quarto")
config = function()
    quarto.setup{
        closePreviewOnExit = true,
        lspfeatures = {
            enabled = true,
            languages = {'python', 'bash', 'lua'},
            chunks = 'curly',
            completion = {
                enabled = true,
            },
        },
        keymap = {
            hover = 'K',
            definition = 'gd'
        },
    }
end
vim.keymap.set('n', '<leader>qp', quarto.quartoPreview, {silent = true, noremap = true})
