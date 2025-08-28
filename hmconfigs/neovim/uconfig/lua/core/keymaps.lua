--Leader Key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keymap = vim.keymap

--Splits
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) 
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) 
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })
keymap.set("n","<leader>ss","<C-w>w",{ desc = "Switch between splits" })

--Tabs
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) 
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) 
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) 
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) 
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })

--Terminal Exit
keymap.set("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
vim.api.nvim_set_keymap('i', '<Space>', '<Space>', { noremap = true, silent = true })

-- Code Running
keymap.set('n', '<leader>rr', ':RunCode<CR>', { noremap = true, silent = false, desc = "Run Code" })
keymap.set('n', '<leader>rfs', ':RunFile<CR>', { noremap = true, silent = false, desc = "Run File" })
keymap.set('n', '<leader>rf', ':RunFile tab<CR>', { noremap = true, silent = false, desc = "Run File Tab"})
keymap.set('n', '<leader>rp', ':RunProject<CR>', { noremap = true, silent = false, desc = "Run Project" })
keymap.set('n', '<leader>rc', ':RunClose<CR>', { noremap = true, silent = false, desc = "Run Close" })
keymap.set('n', '<leader>crf', ':CRFiletype<CR>', { noremap = true, silent = false })
keymap.set('n', '<leader>crp', ':CRProjects<CR>', { noremap = true, silent = false })

-- Toggle Term:
keymap.set('n', '<leader>lt', ':ToggleTerm direction=float name=', {noremap = true, silent = false; desc = "Open new floating terminal"})
keymap.set('n', '<leader>ll', ':TermSelect<CR>', {noremap = true, silent = false, desc = "Select open terminal"})

--Neovide Copy/Paste
if vim.g.neovide then
  keymap.set({'v', 'n'}, '<leader>nb', '"+y', { desc = "Neovide copy" })
  keymap.set({'n', 'v', 'c'}, '<leader>nv', '"+P', { desc = "Neovide paste" })

-- Neovide Text Sizes
  keymap.set({ "n", "v" }, "<C-=>", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1<CR>", {desc = "Neovide increase font size"})
  keymap.set({ "n", "v" }, "<C-->", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.1<CR>,", {desc = "Neovide decrease font size"})
  keymap.set({ "n" , "v" }, "<C-0>", ":lua vim.g.neovide_scale_factor = 1<CR>", {desc = "Neovide font default size"})
end


