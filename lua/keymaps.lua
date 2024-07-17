-- spacebar is the leader key 
vim.g.mapleader = " "


-- define common options
local opts = {
    noremap = true,      -- non-recursive
    silent = true,       -- do not show message
}

-----------------
-- Normal mode --
-----------------

-- Better window navigation
vim.keymap.set('n', '<C-h>', '<C-w>h', opts)
vim.keymap.set('n', '<C-j>', '<C-w>j', opts)
vim.keymap.set('n', '<C-k>', '<C-w>k', opts)
vim.keymap.set('n', '<C-l>', '<C-w>l', opts)

-- jump to commnd mode 
vim.keymap.set("n", ";", ":", {desc = "Enter command mode"})
-- Resize with arrows
-- delta: 2 lines
vim.keymap.set('n', '<C-Up>', ':resize -2<CR>', opts)
vim.keymap.set('n', '<C-Down>', ':resize +2<CR>', opts)
vim.keymap.set('n', '<C-Left>', ':vertical resize -2<CR>', opts)
vim.keymap.set('n', '<C-Right>', ':vertical resize +2<CR>', opts)

-----------------
-- Visual mode --
-----------------

-- Hint: start ;visual mode with the same area as the previous area and the same mode
vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)

-- key mappings 
vim.keymap.set({"i", "v"}, "jk", "<ESC>", {desc = "Enter Nomal mode from insert and visual"})
vim.keymap.set("c", "qqq", "qa", {desc = "Exit all"})
vim.keymap.set("n", "<leader>x", ":q<CR>", opts)
-- key map for file browser 
vim.keymap.set("n", "<leader>fb", ":Telescope file_browser path=%:p:h select_buffer=true<CR>")
vim.keymap.set("n", "<leader>nn", ":NvimTreeToggle<CR>")
vim.keymap.set("n", "<leader>n", ":NvimTreeFocus<CR>")


-- Toggle Relative number
function ToggleRelativeNumber()
  if vim.opt.relativenumber:get() then
    vim.opt.relativenumber = false
    print("Relative line numbers disabled")
  else
    vim.opt.relativenumber = true
    print("Relative line numbers enabled")
  end
end

-- Set the keybinding
vim.api.nvim_set_keymap('n', '<leader>rn', ':lua ToggleRelativeNumber()<CR>', { noremap = true, silent = true })
