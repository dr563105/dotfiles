-- vim.g.nvim_tree_indent_markers = 1
require('nvim-tree').setup {
    actions = {
        open_file={
            resize_window = true,
            quit_on_open = true
        }
    },
    git = {ignore = false},-- displays folders mentioned inside gitignore
    renderer = {
        indent_markers = {enable = true},  
        icons = { webdev_colors = true},
        highlight_opened_files = "icon"
    }
}
-- vim.cmd('nnoremap <leader>e :NvimTreeToggle<CR>')
vim.api.nvim_set_keymap('n', '<leader>e', ':NvimTreeToggle<CR>', {noremap = true})




