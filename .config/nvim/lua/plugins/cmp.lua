local Plugin = { "hrsh7th/nvim-cmp" }

Plugin.dependencies = {
	-- Sources
	{ "hrsh7th/cmp-cmdline" },
	{ "hrsh7th/cmp-path" },
	{ "hrsh7th/cmp-buffer" },
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "neovim/nvim-lspconfig" },

	-- Snippets
	{ "SirVer/ultisnips" },
	{ "quangnguyen30192/cmp-nvim-ultisnips" },
}

Plugin.event = 'InsertEnter'
Plugin.lazy = false -- force Lazy to load plugin on startup

function Plugin.config()
	vim.opt.completeopt = {'menu', 'menuone', 'preview', 'noselect'}

	-- Set up nvim-cmp.
	local _, cmp = pcall(require, 'cmp')
	if not _ then return end

	cmp.setup({
	  snippet = {
		expand = function(args)
		  vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
		end,
	  },
	  sources = {
		{ name = 'nvim_lsp' },
		{ name = 'buffer' },
		{ name = 'path' },
		{ name = 'ultisnips' }, -- For ultisnips users.
	  },
	  window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	  },
	  mapping = {
		  ['<C-b>'] = cmp.mapping.scroll_docs(-4),
		  ['<C-f>'] = cmp.mapping.scroll_docs(4),
		  ['<C-Space>'] = cmp.mapping.complete(),
		  ['<C-e>'] = cmp.mapping.abort(),
		  ['<Tab>'] = cmp.mapping(cmp.mapping.confirm({ select = false }), {'i'}), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
		  ['<Down>'] = cmp.mapping(cmp.mapping.select_next_item(), {'i'}),
		  ['<Up>'] = cmp.mapping(cmp.mapping.select_prev_item(), {'i'}),
	  },
	})


	-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
	cmp.setup.cmdline({ '/', '?' }, {
	  mapping = cmp.mapping.preset.cmdline(),
	  sources = {
		{ name = 'buffer' }
	  }
	})

	-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
	cmp.setup.cmdline(':', {
	  mapping = cmp.mapping.preset.cmdline(),
	  sources = cmp.config.sources({
		{ name = 'path' }
	  }, {
		{ name = 'cmdline' }
	  })
	})

	-- Set up lspconfig.
	local capabilities = require('cmp_nvim_lsp').default_capabilities()
	-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
	require('lspconfig')['clangd'].setup {
	  capabilities = capabilities
	}
end

return Plugin
