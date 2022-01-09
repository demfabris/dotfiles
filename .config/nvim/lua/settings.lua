Vim = vim
-- Set configs
local set = Vim.opt
local setg = Vim.go
local cmd = Vim.cmd

-- Ident configs
set.tabstop = 2
set.shiftwidth = 2
set.textwidth = 80
set.scrolloff = 8
set.expandtab = true

-- Show line numbers
set.number = true
set.signcolumn = 'yes'

-- Paint cursor line
set.cursorline = true

-- Auto read file if changes outside vim
set.autoread = true

-- Highlight search pattern incrementally
set.incsearch = true

-- Use system clipboard
set.clipboard:append('unnamedplus')

-- Mouse mode
set.mouse = 'a'

-- Allow closed terminals
set.hidden = true

-- Sensible
set.encoding = 'utf-8'
set.fileformat = 'unix'
set.autoindent = true
set.backspace = 'indent,eol,start'

-- Proper search
set.incsearch = true
set.ignorecase = true
set.smartcase = true
set.gdefault = true

-- Show problematic characters.
set.list = true

-- Avoid showing extra messages when using completion
set.shortmess:append('c')

-- Remove trailing whitespaces
cmd('command! FixWhitespace :%s/\\s\\+$//e')

-- Sane splits
set.splitright = true
set.splitbelow = true

set.timeoutlen = 300 -- http://stackoverflow.com/questions/2158516/delay-before-o-opens-a-new-line

-- You will have bad experience for diagnostic messages when it's default 4000.
setg.updatetime = 250

set.printoptions = 'paper:letter'

