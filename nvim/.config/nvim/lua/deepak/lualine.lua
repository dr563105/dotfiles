require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = {},
        section_separators = {},
        disabled_filetypes = {},
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {{'branch'}, {'diff',colored=false}},
        lualine_c = {{'filename'},{'diagnostics', sources={'nvim_diagnostic'}}},
        lualine_x = {"os.date('%b %d,%Y')"},
        lualine_y = {'ln:','%02l/%L'},
        lualine_z = {'progress'}
    },
    inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
}
