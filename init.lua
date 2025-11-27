require('core/options').setup()
require('core/keymaps').setup()

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
	{ src = "https://github.com/mfussenegger/nvim-jdtls" },
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
	sources = {
	'lsp',
	'snippets',
	'path',
	-- 'buffer' -- Commenting this cause it only pollutes suggestions for important stuff
	-- -- When writing a document maybe it would be somewhat useful
	},
	signature = { enabled = true },
})
vim.cmd("set completeopt=menu,menuone,noselect")

-- require "oil".setup()
require "mini.pick".setup()
-- require "nvim-jdtls".setup()
-- vim.lsp.config('jdtls', {
-- 	cmd
-- })
vim.lsp.config('jdtls', { -- This is kinda mostly here just to confirm that this works.
	cmd = {'jdtls'},
	init_options = {
		extendedClientCapabilities = require ('jdtls.capabilities')
	}
})
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
