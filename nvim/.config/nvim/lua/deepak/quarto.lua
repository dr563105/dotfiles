-- Quarto bindings
config = function()
    local otter = require("otter")
    otter.setup{
        lsp = {
          hover = {
            border = require 'misc.style'.border
          }
        }
    }
end

local quarto = require("quarto")
quarto.setup{}
    -- closePreviewOnExit = true,
    -- lspfeatures = {
    --     enabled = true,
    --     languages = {'python', 'bash', 'lua'},
    --     chunks = 'curly',
    --     completion = {
    --         enabled = true,
    --     },
    -- },
    -- keymap = {
    --     hover = 'K',
    --     definition = 'gd'
    -- },
-- }
vim.keymap.set('n', '<leader>qp', quarto.quartoPreview, {silent = true, noremap = true})
