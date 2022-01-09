local lualine = require('lualine')

lualine.setup({
    options = {
				theme = 'ayu_dark',
        icons_enabled = true,
				component_separators = { left = '|', right = '|'},
				section_separators = { left = '', right = ''}
    },
    sections = {
        lualine_c = {
            {
                'filename',
                file_status = true, -- displays file status (readonly status, modified status)
                path = 1, -- 0 = just filename, 1 = relative path, 2 = absolute path
            },
            {
							'lsp_progress'
            },
        },
        lualine_z = {
            'location',
            {
                'diagnostics',
                sources = { 'nvim_diagnostic' },
                symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' },
            },
        },
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {
            {
                'filename',
                file_status = true, -- displays file status (readonly status, modified status)
                path = 1, -- 0 = just filename, 1 = relative path, 2 = absolute path
            },
        },
        lualine_x = { 'location' },
    },
    tabline = {},
    extensions = { 'quickfix', 'chadtree', 'fugitive' },
})
