vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>w", vim.cmd.w)
vim.keymap.set("n", "<leader>wq", vim.cmd.wq)
vim.keymap.set("n", "<leader>q", vim.cmd.close)
vim.keymap.set("n", "<leader>Q", vim.cmd.qa)

vim.keymap.set("n", "-", ":split<CR>")
vim.keymap.set("n", "|", ":vsplit<CR>")
vim.keymap.set("n", "<Tab>", ":bnext<CR>")
vim.keymap.set("n", "<S-Tab>", ":bprev<CR>")
-- vim.keymap.set("n", "<leader>i", ":lua vim.diagnostic.open_float(nil, {focus=false, scope="cursor"})<CR>")
-- vim.keymap.set('n', '<leader>bd', ':bn<cr>bd#<cr>', {})
