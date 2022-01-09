Vim = vim
local cmd = Vim.cmd

-- ensure packer is installed
cmd([[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
]])

-- Remember cursor position
cmd([[
    augroup vimrc-remember-cursor-position
        autocmd!
        autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
    augroup END
]])

-- auto format file on save
cmd([[
    augroup Format
        autocmd!
        autocmd BufWritePre *.{py,rs,js,ts,c,cpp,h,hpp,sh,fish,go,md,lua,json,java,cs} silent! undojoin | lua vim.lsp.buf.formatting_seq_sync()
    augroup END
]])

-- Highlight yanked text
Vim.api.nvim_command(
    [[autocmd TextYankPost * lua require'vim.highlight'.on_yank({ higroup = 'IncSearch', timeout = 1000 })]]
)

-- Show hover diagnostics
Vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false, scope="cursor"})]]

