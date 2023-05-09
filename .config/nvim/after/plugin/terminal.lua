local fterm = require("FTerm")
fterm.setup({
	auto_close = true,
})

vim.keymap.set("n", "<leader><Enter>", function()
	fterm.toggle()
end, { desc = 'Open terminal'})

local makeCommand = { "make", "clean", "&&", "make" }
local duneCommand = { "dune", "build" }
local goCommand = { "go", "build" }
local cargoCommand = { "cargo", "build" }

local runners = {
	c = makeCommand,
	cpp = makeCommand,
	make = makeCommand,
	ocaml = duneCommand,
	dune = duneCommand,
	go = goCommand,
	rust = cargoCommand,
}

vim.keymap.set("n", "<leader>tb", function()
	local buf = vim.api.nvim_buf_get_name(0)
	local ftype = vim.filetype.match({ filename = buf })
	local exec = runners[ftype]
	if exec ~= nil then
		fterm.scratch({ cmd = exec })
	end
end, { desc = 'Build project'})
