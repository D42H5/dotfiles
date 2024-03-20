local Plugin = { "nvim-treesitter/nvim-treesitter" }

Plugin.dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" }
Plugin.build = ":TSUpdate"
Plugin.opts = {
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	-- :help nvim-treesitter-textobjects-modules
	textobjects = {
		select = {
			enable = true,
			lookahead = true,
			keymaps = {
			}
		},
	},
	ensure_installed = {
		'c',
		'cpp',
		'lua',
		'python',
		'rust'
	},
	sync_install = false,
	auto_install = false,
}

function Plugin.config(opts)
	require('nvim-treesitter.configs').setup(opts)
end

return Plugin
