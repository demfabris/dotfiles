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
    char = '|',
    filetype_exclude = { 'packer', 'alpha' },
    buftype_exclude = { 'terminal' },
		space_char_blankline = " ",
    show_current_context = true,
		show_current_context_start = true,
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
