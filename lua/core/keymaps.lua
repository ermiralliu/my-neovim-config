local M = {}
-- the binding below esht per kompjuterin te puna
-- vim.keymap.set('i', 'jj', '<Esc>', {noremap = true, silent= true})
-- vim.o.timeoutlen = 200 -- this is so pressing j causes less of a wait (although if you press a non-j key right after it's not like you will have a big problem anyway)
-- good shortcuts
function M.setup()
	vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format)
	vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action)
	vim.keymap.set({ 'n', 'v', 'x' }, '<leader>p', '"+p') -- shortcuts for these are quite useful
	vim.keymap.set({ 'n', 'v', 'x' }, '<leader>y', '"+y')
	-- nvim-tree
	vim.keymap.set('n', '<leader>t', '<cmd>NvimTreeToggle<CR>', { desc = 'Toggle Project Tree' })
	vim.keymap.set('n', '<leader>T', '<cmd>NvimTreeFindFile<CR>', { desc = 'Find Current File in Tree' })
	-- buffers/tabs
	vim.keymap.set('n', '<leader>j', '<cmd>BufferNext<CR>', { desc = 'Next Buffer' })
	vim.keymap.set('n', '<leader>J', '<cmd>BufferPrevious<CR>', { desc = 'Previous Buffer' })
	vim.keymap.set('n', '<leader>1', '<cmd>BufferGoto 1<CR>', { desc = 'Go to Buffer 1' })
	vim.keymap.set('n', '<leader>2', '<cmd>BufferGoto 2<CR>', { desc = 'Go to Buffer 2' })
	vim.keymap.set('n', '<leader>3', '<cmd>BufferGoto 3<CR>', { desc = 'Go to Buffer 3' })
	vim.keymap.set('n', '<leader>4', '<cmd>BufferGoto 4<CR>', { desc = 'Go to Buffer 4' })
	vim.keymap.set('n', '<leader>5', '<cmd>BufferGoto 5<CR>', { desc = 'Go to Buffer 5' })
	vim.keymap.set('n', '<leader>6', '<cmd>BufferGoto 6<CR>', { desc = 'Go to Buffer 6' })
	vim.keymap.set('n', '<leader>7', '<cmd>BufferGoto 7<CR>', { desc = 'Go to Buffer 7' })
	vim.keymap.set('n', '<leader>8', '<cmd>BufferGoto 8<CR>', { desc = 'Go to Buffer 8' })
	vim.keymap.set('n', '<leader>9', '<cmd>BufferGoto 9<CR>', { desc = 'Go to Buffer 9' })
	vim.keymap.set('n', '<leader>n', '<cmd>wincmd l | enew<CR>', { desc = 'Create New Buffer' })
	vim.keymap.set('n', '<leader>q', '<cmd>bd | BufferGoto 1<CR>', { desc = 'Write and Close Buffer' }) -- Initially I wrote for this, but then I decided that was kinda dangerous as I could modify system files accidentally, which is why if you wanna save it, save it manually bro
	vim.keymap.set('n', '<leader>Q', '<cmd>bd! | BufferGoto 1<CR>', { desc = 'Force Close Buffer' })
	-- telescope
	vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<CR>', { desc = 'Telescope Find Files' })
	vim.keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<CR>', { desc = 'Telescope Live Grep' })
end

return M;
