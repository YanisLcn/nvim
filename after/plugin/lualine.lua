require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = Session_theme,
        component_separators = '|',
        section_separators = { left = '', right = '' },
    },
    extensions = { 'fugitive' },
}
