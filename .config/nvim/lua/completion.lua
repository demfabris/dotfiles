Vim = vim

local settings = {
	auto_start = 'shut-up',
	xdg = true,

	-- Keymaps
	keymap = {
		recommended = false
	},

	-- Display options
	display = {
		mark_highlight_group = 'Pmenu',
		ghost_text = {
			enabled = false,
		},
		preview = {
			resolve_timeout = 0.5
		},
		icons = {
			spacing = 2
		}
	},

	-- Completion
	completion = {
		smart = false,
	},

	-- Sources
	clients = {
		tmux = {
			enabled = false
		},
		snippets = {
			weight_adjust = 1.4
		},
		lsp = {
			resolve_timeout = 0.1
		}
	}
}

-- Auto pairs config
local remap = Vim.api.nvim_set_keymap
local npairs = require('nvim-autopairs')

npairs.setup({ map_bs = false, map_cr = false })

remap('i', '<esc>', [[pumvisible() ? "<c-e><esc>" : "<esc>"]], { expr = true, noremap = true })
remap('i', '<c-c>', [[pumvisible() ? "<c-e><c-c>" : "<c-c>"]], { expr = true, noremap = true })
remap('i', '<tab>', [[pumvisible() ? "<c-n>" : "<tab>"]], { expr = true, noremap = true })
remap('i', '<s-tab>', [[pumvisible() ? "<c-p>" : "<bs>"]], { expr = true, noremap = true })

_G.MUtils= {}

MUtils.CR = function()
  if Vim.fn.pumvisible() ~= 0 then
    if Vim.fn.complete_info({ 'selected' }).selected ~= -1 then
      return npairs.esc('<c-y>')
    else
      return npairs.esc('<c-e>') .. npairs.autopairs_cr()
    end
  else
    return npairs.autopairs_cr()
  end
end
remap('i', '<cr>', 'v:lua.MUtils.CR()', { expr = true, noremap = true })

MUtils.BS = function()
  if Vim.fn.pumvisible() ~= 0 and Vim.fn.complete_info({ 'mode' }).mode == 'eval' then
    return npairs.esc('<c-e>') .. npairs.autopairs_bs()
  else
    return npairs.autopairs_bs()
  end
end
remap('i', '<bs>', 'v:lua.MUtils.BS()', { expr = true, noremap = true })

-- Apply settings
Vim.g.coq_settings = settings
