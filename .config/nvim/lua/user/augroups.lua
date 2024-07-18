-- Group for highlighting related stuff
local highlightgroup = augroup("highlightgroup", {})

-- Enable highlighting of all matches only when searching
autocmd(
	{"CmdlineEnter"},
	{
		pattern = '/,?,:',
		callback = function()
			vim.o.hlsearch = true
		end,
		group = highlightgroup
	}
)
-- Disable highlighting of all matches when not searching
autocmd(
	{"CmdlineLeave"},
	{
		pattern = '/,?,:',
		callback = function()
			vim.o.hlsearch = false
		end,
		group = highlightgroup
	}
)
