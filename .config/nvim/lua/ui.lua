Vim = vim
local set = Vim.opt
local global = Vim.g

set.background = 'dark'
set.termguicolors = true

-- Cursor mode switch
set.guicursor = 'n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor'

-- Git signs
require('gitsigns').setup({ signcolumn = true, numhl = true })

-- Icons
require('nvim-web-devicons').setup({ default = true })

-- Identline
require('indent_blankline').setup({
    char = '┊',
    filetype_exclude = { 'packer', 'alpha' },
    buftype_exclude = { 'terminal' },
		space_char_blankline = " ",
    show_current_context = true,
		show_current_context_start = false,
		use_treesitter = true,
})

-- Colorscheme
require('ayu').colorscheme()

local chadtree_settings = {
	xdg = true,
	options = {
		show_hidden = true,
	},
	view = {
		width = 28
	},
	theme = {
		text_colour_set = 'env'
	},
}

global.chadtree_settings = chadtree_settings

-- Tabline
global.bufferline = {
    animation = true,
    auto_hide = false,
    tabpages = true,
    closable = true,
    clickable = true,
    icons = 'both',
    icon_separator_active = '▎',
    icon_separator_inactive = '▎',
    icon_close_tab = '',
    icon_close_tab_modified = '●',
    icon_pinned = '車',
    insert_at_end = true,
    maximum_padding = 2,
    maximum_length = 40,
    semantic_letters = true,
    letters = 'asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP',
}

-- Terminal
require('toggleterm').setup({
    size = function(term)
        if term.direction == 'horizontal' then
            return 15
        elseif term.direction == 'vertical' then
            return Vim.o.columns * 0.4
        end
    end,
    hide_numbers = true,
    shade_terminals = true,
    start_in_insert = true,
    insert_mappings = false, -- no default mapping
    persist_size = true,
    direction = 'float',
		shading_factor = 3,
    close_on_exit = true,
    shell = Vim.o.shell,
		open_mapping = [[<C-t>]],
    float_opts = {
        border = 'curved',
        highlights = {
            border = 'Normal',
            background = 'Normal',
        },
    },
})

function _G.set_terminal_keymaps()
    local opts = { noremap = true }
    Vim.api.nvim_buf_set_keymap(0, 't', '<C-t>', [[<C-\><C-n><C-W>j]], opts)
end

Vim.cmd('autocmd! TermOpen term://*toggleterm#* lua set_terminal_keymaps()')
