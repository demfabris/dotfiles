Vim = vim

local wk = require('which-key')

local keymap = Vim.api.nvim_set_keymap

local no_remap_opt = { noremap = true }
local silent_opt = { silent = true }
local no_remap_silent_opt = { noremap = true, silent = true }

-- Center search results
keymap('n', 'n', 'nzz', no_remap_silent_opt)
keymap('n', 'N', 'Nzz', no_remap_silent_opt)

-- Page Nav
keymap('n', '<S-Up>', '<C-U>', silent_opt)
keymap('n', '<S-Down>', '<C-D>', silent_opt)

-- Increment and decrement numbers
keymap('n', '+', '<C-a>', no_remap_opt)
keymap('n', '-', '<C-x>', no_remap_opt)

-- Dont deselect indents
keymap('v', '<', '<gv', no_remap_opt)
keymap('v', '>', '>gv', no_remap_opt)

-- Navigate buffers
keymap('n', '<C-left>', ':BufferPrevious<CR>', no_remap_opt)
keymap('n', '<C-right>', ':BufferNext<CR>', no_remap_opt)
keymap('n', '<C-q>', ':BufferClose<CR>', no_remap_opt)
keymap('n', '<M-1>', ':BufferGoto 1<CR>', no_remap_opt)
keymap('n', '<M-2>', ':BufferGoto 2<CR>', no_remap_opt)
keymap('n', '<M-3>', ':BufferGoto 3<CR>', no_remap_opt)
keymap('n', '<M-4>', ':BufferGoto 4<CR>', no_remap_opt)
keymap('n', '<M-5>', ':BufferGoto 5<CR>', no_remap_opt)
keymap('n', '<M-6>', ':BufferGoto 6<CR>', no_remap_opt)
keymap('n', '<M-7>', ':BufferGoto 7<CR>', no_remap_opt)
keymap('n', '<M-8>', ':BufferGoto 8<CR>', no_remap_opt)
keymap('n', '<M-9>', ':BufferGoto 9<CR>', no_remap_opt)
keymap('n', '<tab><left>', ':BufferMovePrevious<CR>', no_remap_opt)
keymap('n', '<tab><right>', ':BufferMoveNext<CR>', no_remap_opt)

-- GoTo code navigation
keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', silent_opt)
keymap('n', 'gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>', silent_opt)
keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', silent_opt)
keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', silent_opt)
keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references({ includeDeclaration = false })<CR>', silent_opt)

-- Hover action
keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', silent_opt)

-- Sidebar
keymap('n', '<C-s>', '<cmd>CHADopen<CR>', no_remap_opt)

-- Space keybindings
wk.register({
	  f = {
        name = 'File',
        b = { '<cmd>lua require("telescope.builtin").buffers()<CR>', 'Buffers' },
        f = { '<cmd>lua require("telescope.builtin").find_files()<CR>', 'Files' },
				e = { '<cmd>lua require("telescope.builtin").file_browser()<CR>', 'File Browser' },
    },
		r = {
        name = 'Rust',
        R = { ':RustReloadWorkspace<CR>', 'Reload' },
        r = { ':RustRunnables<CR>', 'Runnables' },
        d = { ':RustDebuggables<CR>', 'Debuggables' },
        e = { ':RustExpandMacro<CR>', 'Expand Macro' },
        c = { ':RustOpenCargo<CR>', 'Open Cargo.toml' },
        g = { ':RustViewCrateGraph<CR>', 'View Crate Graph' },
        m = { ':RustParentModule<CR>', 'Parent Module' },
        j = { ':RustJoinLines<CR>', 'Join Lines' },
        a = { ':RustHoverActions<CR>', 'Hover Actions' },
        h = { ':RustHoverRange<CR>', 'Range Hover Actions' },
        b = { ':RustMoveItemDown<CR>', 'Move Item Down' },
        u = { ':RustMoveItemUp<CR>', 'Move Item Up' },
        s = { ':RustStartStandaloneServerForBuffer<CR>', 'New Server for Buffer' },
    },
    p = {
        name = 'Grep',
        g = { '<cmd>lua require("telescope.builtin").grep_string()<CR>', 'Grep String' },
        l = { '<cmd>lua require("telescope.builtin").live_grep()<CR>', 'Live Grep' },
        r = { '<cmd>lua require("telescope").extensions.live_grep_raw.live_grep_raw()<CR>', 'Live Grep Raw' },
    },
		-- v = {
  --       name = 'Vim',
  --       q = { '<cmd>lua require("telescope.builtin").quickfix()<CR>', 'Quickfix List' },
  --       l = { '<cmd>lua require("telescope.builtin").loclist()<CR>', 'Location List' },
  --       j = { '<cmd>lua require("telescope.builtin").jumplist()<CR>', 'Jump List' },
  --       c = { '<cmd>lua require("telescope.builtin").commands()<CR>', 'Commands' },
  --       h = { '<cmd>lua require("telescope.builtin").command_history()<CR>', 'Command History' },
  --       s = { '<cmd>lua require("telescope.builtin").search_history()<CR>', 'Search History' },
  --       m = { '<cmd>lua require("telescope.builtin").man_pages()<CR>', 'Man Pages' },
  --       k = { '<cmd>lua require("telescope.builtin").marks()<CR>', 'Marks' },
  --       o = { '<cmd>lua require("telescope.builtin").colorscheme()<CR>', 'Colorscheme' },
  --       r = { '<cmd>lua require("telescope.builtin").registers()<CR>', 'Registers' },
  --       a = { '<cmd>lua require("telescope.builtin").autocommands()<CR>', 'Autocommands' },
  --       p = { '<cmd>lua require("telescope.builtin").vim_options()<CR>', 'Vim Options' },
  --       e = { '<cmd>lua require("telescope.builtin").spell_suggest()<CR>', 'Spell Suggestions' },
  --       y = { '<cmd>lua require("telescope.builtin").keymaps()<CR>', 'Normal Mode Keymaps' },
  --   },
		g = {
        name = 'Git',
        f = { '<cmd>lua require("telescope.builtin").git_files()<CR>', 'Files' },
        s = { '<cmd>lua require("telescope.builtin").git_status()<CR>', 'Status' },
        c = { '<cmd>lua require("telescope.builtin").git_commits()<CR>', 'Commit Log' },
        l = { '<cmd>lua require("telescope.builtin").git_bcommits()<CR>', 'Commit Log Current Buffer' },
        b = { '<cmd>lua require("telescope.builtin").git_branches()<CR>', 'Branches' },
        t = { '<cmd>lua require("telescope.builtin").git_stash()<CR>', 'Stash' },
        B = { '<cmd>lua require("gitsigns").blame_line()<CR>', 'Blame' },
    },
		-- l = {
  --       name = 'LSP',
  --       r = { '<cmd>lua require("telescope.builtin").lsp_references()<CR>', 'References' },
  --       d = { '<cmd>lua require("telescope.builtin").lsp_definitions()<CR>', 'Definitions' },
  --       t = { '<cmd>lua require("telescope.builtin").lsp_type_definitions()<CR>', 'Type Definitions' },
  --       i = { '<cmd>lua require("telescope.builtin").lsp_implementations()<CR>', 'Implementations' },
  --       s = { '<cmd>lua require("telescope.builtin").lsp_document_symbols()<CR>', 'Document Symbols' },
  --       w = { '<cmd>lua require("telescope.builtin").lsp_workspace_symbols()<CR>', 'Workspace Symbols' },
  --       v = {
  --           '<cmd>lua require("telescope.builtin").lsp_dynamic_workspace_symbols()<CR>',
  --           'Dynamic Workspace Symbols',
  --       },
  --       a = { '<cmd>lua require("telescope.builtin").lsp_code_actions()<CR>', 'Code Actions' },
  --       n = { '<cmd>lua require("telescope.builtin").lsp_range_code_actions()<CR>', 'Range Code Actions' },
  --       g = { '<cmd>lua require("telescope.builtin").lsp_document_diagnostics()<CR>', 'Document Diagnostics' },
  --       o = { '<cmd>lua require("telescope.builtin").lsp_workspace_diagnostics()<CR>', 'Workspace Diagnostics' },
  --       e = { '<cmd>lua require("telescope.builtin").treesitter()<CR>', 'Treesitter' },
  --       l = { '<cmd>lua vim.lsp.codelens.display()<CR>', 'Code Lens' },
  --   },
		t = {
        name = 'Telescope',
        s = { '<cmd>lua require("telescope.builtin").planets()<CR>', 'Use Telescope...' },
        c = { '<cmd>lua require("telescope.builtin").builtin()<CR>', 'Builtin Pickers' },
        h = { '<cmd>lua require("telescope.builtin").reloader()<CR>', 'Reload Lua Modules' },
        y = { '<cmd>lua require("telescope.builtin").symbols()<CR>', 'List Symbols' },
        m = { '<cmd>lua require("telescope.builtin").resume()<CR>', 'Resume Last Picker' },
        r = { '<cmd>lua require("telescope.builtin").pickers()<CR>', 'Previous Pickers' },
    },
}, {
	prefix = '<space>',
	noremap = true,
	silent = true,
	mode = 'n',
})

require('Comment').setup({})
