vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set softtabstop=2")
vim.cmd("set number")
--vim.cmd("set relativenumber")
vim.g.mapleader = " "
vim.keymap.set("n", "<Leader>w", "<C-w>", {})


vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", {})
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", {})
vim.keymap.set("n", "<C-Up>", ":resize -2<CR>", {})
vim.keymap.set("n", "<C-Down>", ":resize +2<CR>", {})

vim.keymap.set({ "v", "n" }, "<Leader>j", ":bprev<CR>", {})
vim.keymap.set({ "v", "n" }, "<Leader>k", ":bnext<CR>", {})
vim.keymap.set({ "v", "n" }, "<Leader>dd", ":bd<CR>", {})

vim.keymap.set({"v", "n"}, "<Leader>dad", ":%bd|e#|bd#<CR>", {})

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

