-- vim.g.nvim_tree_indent_markers = 1
vim.g.nvim_tree_highlight_opened_files = 1
require('nvim-tree').setup {
    auto_close = false,
    view = {auto_resize = true},
    git = {ignore = false},-- displays folders mentioned inside gitignore
    renderer = {
        indent_markers = {enable = true},  
        icons = { webdev_colors = true}
    }
}
-- vim.cmd('nnoremap <leader>e :NvimTreeToggle<CR>')
vim.api.nvim_set_keymap('n', '<leader>e', ':NvimTreeToggle<CR>', {noremap = true})




