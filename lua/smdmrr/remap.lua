vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex) -- default file explorer

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")  -- move text up
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")  -- move text down

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- Changing current word in whole file
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Make file exectable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
vim.keymap.set("i", "fj", "<esc>")           -- fast escape
vim.keymap.set("n", "<leader>,", ":noh<CR>") -- disable highligths

-- just comfo
vim.keymap.set("n", "L", "$")
vim.keymap.set("n", "H", "^")
vim.keymap.set("n", ";", ":")
vim.keymap.set("n", "<leader>q", ":q!<Cr>")
vim.keymap.set("n", "<leader>a", ":wa<Cr>")

-- don't use arrows keys
vim.keymap.set("", "<Up>", "<nop>")
vim.keymap.set("", "<Down>", "<nop>")
vim.keymap.set("", "<Left>", "<nop>")
vim.keymap.set("", "<Right>", "<nop>")

-- Breckets autocomplitions
-- vim.keymap.set("i", "(", "()<Esc>i")
-- vim.keymap.set("i", "{", "{}<Esc>i")
-- vim.keymap.set("i", "{<CR>", "{<CR>}<Esc>O")
-- vim.keymap.set("i", "[", "[]<Esc>i")
-- vim.keymap.set("i", "'", "''<Esc>i")
-- vim.keymap.set("i", "\"", "\"\"<Esc>i")

-- Window managment
vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
vim.keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
vim.keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

-- Buffers managment
vim.keymap.set("n", "<leader>bn", ":bnext<Cr>")
vim.keymap.set("n", "<leader>bb", ":bprevious<Cr>")
vim.keymap.set("n", "<leader>bd", ":bdelete<Cr>")
