-- vim.o.number = true
-- vim.o.relativenumber = true
-- vim.o.wrap = false
-- vim.o.tabstop = 2
-- vim.o.shiftwidth = 2
-- vim.o.swapfile = false
-- vim.o.winborder = "rounded"
-- vim.o.startofline = true
require('core/options').setup()
require('core/keymaps').setup()

-- vim.g.mapleader = "\\" -- It's finally fucking working
-- the binding below esht per kompjuterin te puna
-- vim.keymap.set('i', 'jj', '<Esc>', {noremap = true, silent= true})
-- vim.o.timeoutlen = 200 -- this is so pressing j causes less of a wait (although if you press a non-j key right after it's not like you will have a big problem anyway)
-- good shortcuts
-- vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format)
-- vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action)
-- vim.keymap.set({ 'n', 'v', 'x' }, '<leader>p', '"+p') -- shortcuts for these are quite useful
-- vim.keymap.set({ 'n', 'v', 'x' }, '<leader>y', '"+y')
-- -- nvim-tree
-- vim.keymap.set('n', '<leader>t', '<cmd>NvimTreeToggle<CR>', { desc = 'Toggle Project Tree' })
-- vim.keymap.set('n', '<leader>T', '<cmd>NvimTreeFindFile<CR>', { desc = 'Find Current File in Tree' })
-- -- buffers/tabs
-- vim.keymap.set('n', '<leader>j', '<cmd>BufferNext<CR>', { desc = 'Next Buffer' })
-- vim.keymap.set('n', '<leader>J', '<cmd>BufferPrevious<CR>', { desc = 'Previous Buffer' })
-- vim.keymap.set('n', '<leader>1', '<cmd>BufferGoto 1<CR>', { desc = 'Go to Buffer 1' })
-- vim.keymap.set('n', '<leader>2', '<cmd>BufferGoto 2<CR>', { desc = 'Go to Buffer 2' })
-- vim.keymap.set('n', '<leader>3', '<cmd>BufferGoto 3<CR>', { desc = 'Go to Buffer 3' })
-- vim.keymap.set('n', '<leader>4', '<cmd>BufferGoto 4<CR>', { desc = 'Go to Buffer 4' })
-- vim.keymap.set('n', '<leader>5', '<cmd>BufferGoto 5<CR>', { desc = 'Go to Buffer 5' })
-- vim.keymap.set('n', '<leader>6', '<cmd>BufferGoto 6<CR>', { desc = 'Go to Buffer 6' })
-- vim.keymap.set('n', '<leader>7', '<cmd>BufferGoto 7<CR>', { desc = 'Go to Buffer 7' })
-- vim.keymap.set('n', '<leader>8', '<cmd>BufferGoto 8<CR>', { desc = 'Go to Buffer 8' })
-- vim.keymap.set('n', '<leader>9', '<cmd>BufferGoto 9<CR>', { desc = 'Go to Buffer 9' })
-- vim.keymap.set('n', '<leader>n', '<cmd>wincmd l | enew<CR>', { desc = 'Create New Buffer' })
-- vim.keymap.set('n', '<leader>q', '<cmd>bd | BufferGoto 1<CR>', { desc = 'Write and Close Buffer' }) -- Initially I wrote for this, but then I decided that was kinda dangerous as I could modify system files accidentally, which is why if you wanna save it, save it manually bro
-- vim.keymap.set('n', '<leader>Q', '<cmd>bd! | BufferGoto 1<CR>', { desc = 'Force Close Buffer' })
-- -- telescope
-- vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<CR>', { desc = 'Telescope Find Files' })
-- vim.keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<CR>', { desc = 'Telescope Live Grep' })

vim.pack.add({
	-- {src = "https://github.com/rebelot/kanagawa.nvim"},
	-- {src = "https://github.com/catppuccin/nvim"},
	{ src = "https://github.com/rktjmp/lush.nvim" },
	-- go to arctic.nvim directory and modify that if you need to modify the theme. I already made some modifications.
	{ src = "https://github.com/rockyzhang24/arctic.nvim",     requires = { 'rktjmp/lush.nvim' } },
	{ src = "https://github.com/windwp/nvim-autopairs" },
	{ src = "https://github.com/echasnovski/mini.pick" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/chomosuke/typst-preview.nvim" },
	{ src = "https://github.com/saghen/blink.cmp" },
	{ src = "https://github.com/romgrk/barbar.nvim" },
	{ src = "https://github.com/nvim-tree/nvim-web-devicons" },
	{ src = "https://github.com/nvim-tree/nvim-tree.lua" },
	{ src = "https://github.com/julianolf/nvim-dap-lldb" },
	-- rust
	{ src = "https://github.com/mfussenegger/nvim-dap" },
	-- { src = "https://github.com/mrcjkb/rustaceanvim" },
	{ src = "https://github.com/akinsho/toggleterm.nvim" },
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
	{ src = "https://github.com/nvim-telescope/telescope.nvim" },
})
require('telescope').setup({})
require("toggleterm").setup({ -- Kto zakonisht jane ne function config() te ato te lazy nvim
	-- size = vim.o.lines * 0.25,
	size = 10,
	open_mapping = [[<c-\>]],
	direction = 'horizontal', -- 'horizontal' for bottom
	shade_terminals = true,
	start_in_insert = true,
	persist_size = true,
})

require('nvim-web-devicons').setup({})
require('nvim-tree').setup({})
require("barbar").setup({})

require('nvim-autopairs').setup({})

require('blink.cmp').setup({
	keymap = { preset = 'enter' }, -- or 'enter' or 'super-tab'
	appearance = {
		-- use_nvim_cmp_as_default = true,
		nerd_font_variant = 'mono'
	},
	signature = { enabled = true },
})
vim.cmd("set completeopt=menu,menuone,noselect")

-- require "oil".setup()
require "mini.pick".setup()

vim.lsp.enable({
	"lua_ls",
	"clangd",
	"jdtls",
	"rust_analyzer",
	"biome",
	"svelte",
	-- "csharp_ls" -- kjo me duhet ne pune
})

vim.lsp.inlay_hint.enable()
-- I think I finally got a fucking decent color theme
vim.cmd("colorscheme arctic")
vim.diagnostic.config({
	virtual_text = {
		prefix = '|',
		severity = { min = vim.diagnostic.severity.WARN },
	},
	update_in_insert = false,
	underline = true,
	severity_sort = true,
})
