vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set softtabstop=2")

--set line number
vim.cmd("set number")
vim.cmd("set relativenumber")

--search insensitive
vim.cmd("set ignorecase")
vim.cmd("set smartcase")

--close net-tree before vim exit to avoid seesion save neo-tree buffer
local function clean_stuff()
	require("neo-tree").close_all()
end
vim.api.nvim_create_autocmd("VimLeavePre", {
	callback = clean_stuff,
})
---------

vim.g.mapleader = " "
vim.keymap.set("n", "<Leader>w", "<C-w>", {})

vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", {})
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", {})
vim.keymap.set("n", "<C-Up>", ":resize -2<CR>", {})
vim.keymap.set("n", "<C-Down>", ":resize +2<CR>", {})

local bnextdlast = function()
	vim.cmd("bnext")
	vim.cmd("bdelete #")
end
local bprevdlast = function()
	vim.cmd("bprev")
	vim.cmd("bdelete #")
end

vim.keymap.set({ "v", "n" }, "<Leader>j", ":bprev<CR>", {})
vim.keymap.set({ "v", "n" }, "<Leader>k", ":bnext<CR>", {})
vim.keymap.set({ "v", "n" }, "<Leader>dd", ":bd<CR>", {})
vim.keymap.set({ "v", "n" }, "<Leader>dj", bprevdlast, {})
vim.keymap.set({ "v", "n" }, "<Leader>dk", bnextdlast, {})

local bufOnly = function()
	local bufs = vim.api.nvim_list_bufs()
	print(vim.inspect(bufs))
	local current_buf = vim.api.nvim_get_current_buf()
	for _, i in ipairs(bufs) do
		if i ~= current_buf then
			vim.api.nvim_buf_delete(i, {})
		end
	end
end

vim.keymap.set({ "v", "n" }, "<Leader>dad", bufOnly, {})
