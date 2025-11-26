---     if client.workspace_folders then
---       local path = client.workspace_folders[1].name
---       if
---         path ~= vim.fn.stdpath('config')
---         and (vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc'))
---       then
---         return
---       end
---     end

--- Checks if the current Neovim session is rooted in the user's config directory.
--- It assumes the project root is the current working directory (CWD).
--- @return boolean
local function is_nvim_config_root_simple()
  -- 1. Get the path to the Neovim config directory (e.g., ~/.config/nvim)
  local nvim_config_dir = vim.fn.stdpath('config')
  -- 2. Get the current working directory
  local current_cwd = vim.fn.getcwd()
  -- 3. Check if the CWD matches the config directory
  -- Note: We use string.match with %/$ to handle potential trailing slashes if they differ
  return nvim_config_dir == current_cwd 
end

--- Returns the workspace library paths for lua_ls based on the CWD.
--- @return table
function get_lua_ls_library()
  if is_nvim_config_root_simple() then
    -- If we are in the Neovim config, return the full Neovim runtime files
    -- This is crucial for recognizing 'vim.*' API functions
    vim.notify('Loading Neovim Lua API library.', vim.log.levels.INFO)
    return vim.tbl_filter(function(d)
					return not d:match(vim.fn.stdpath('config') .. '/?a?f?t?e?r?')
				end, vim.api.nvim_get_runtime_file('', true))
  else
    -- For any other Lua project, return an empty table (or nil, but {} is safer)
    return {}
  end
end

---@type vim.lsp.Config
return {
	cmd = { 'lua-language-server' },
	filetypes = { 'lua' },
	root_markers = {
		'.emmyrc.json',
		'.luarc.json',
		'.luarc.jsonc',
		'.luacheckrc',
		'.stylua.toml',
		'stylua.toml',
		'selene.toml',
		'selene.yml',
		'.git',
	},
	settings = {
		Lua = {
			codeLens = { enable = true },
			hint = { enable = true, semicolon = 'Disable' },

			workspace = {
				checkThirdParty = false,
				-- library = vim.tbl_filter(function(d)
				-- 	return not d:match(vim.fn.stdpath('config') .. '/?a?f?t?e?r?')
				-- end, vim.api.nvim_get_runtime_file('', true))
				library = get_lua_ls_library()
			}
		},
	},
}
