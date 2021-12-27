local treesitter = require('nvim-treesitter.configs')

treesitter.setup {
    highlight = {enable=true},
    incremental_selection = {enable=true}, 
    textobjects = {enable=true},
    ensure_installed = {'python', 'comment', 'html', 'dockerfile', 'vim', 'lua'},
    additional_vim_regex_highlighting = false
}
