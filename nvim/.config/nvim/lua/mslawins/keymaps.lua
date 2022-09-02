local options = { noremap = true, silent = true }
local set_keymap = vim.api.nvim_set_keymap
local VimMode = { Normal = 'n', Visual = 'v' }
local keymaps_path = '~/.config/nvim/lua/user/keymaps.lua'

-- NeoVim mappings
-- enter - turns off the highlight 
set_keymap(VimMode.Normal, '<CR>', ':noh<CR>', options)
-- \k - open keymaps file 
set_keymap(VimMode.Normal, '<leader>k', ':e ' .. keymaps_path .. '<CR>', options)

-- Buffer navigation 
-- using commands from 'romgrk/barbar.nvim'
set_keymap(VimMode.Normal, '<tab>', ':BufferNext<CR>', options)
set_keymap(VimMode.Normal, '<s-tab>', ':BufferPrevious<CR>', options)
set_keymap(VimMode.Normal, '<leader>[', ':BufferPrevious<CR>', options)
set_keymap(VimMode.Normal, '<leader>]', ':BufferNext<CR>', options)
set_keymap(VimMode.Normal, '<leader>q', ':BufferClose<CR>', options)

-- harpoon
set_keymap(VimMode.Normal, '<leader>h', ':lua require("harpoon.ui").toggle_quick_menu()<CR>', options)
set_keymap(VimMode.Normal, '<leader>ha', ':lua require("harpoon.mark").add_file()<CR>', options)

-- Telescope
set_keymap(VimMode.Normal, '<c-f>', ':Telescope find_files<CR>', options)
set_keymap(VimMode.Normal, '<c-g>', ':Telescope live_grep<CR>', options)
set_keymap(VimMode.Normal, '<c-b>', ':Telescope buffers<CR>', options)
set_keymap(VimMode.Normal, '<c-d>', ':Telescope diagnostics<CR>', options)
set_keymap(VimMode.Normal, '<c-h>', ':Telescope harpoon marks<CR>', options)
set_keymap(VimMode.Normal, '<leader>gs', ':Telescope grep_string<CR>', options)

-- nvim-tree
set_keymap(VimMode.Normal, '<leader>t', ':NvimTreeToggle<CR>', options)
set_keymap(VimMode.Normal, '<leader>tb', ':NvimTreeResize +20<CR>', options)
set_keymap(VimMode.Normal, '<leader>ts', ':NvimTreeResize -20<CR>', options)

-- nvim-comment
set_keymap(VimMode.Normal, '<leader>c', ':CommentToggle<CR>', options)
set_keymap(VimMode.Visual, '<leader>c', ':CommentToggle<CR>', options)

-- git blame
set_keymap(VimMode.Normal, '<leader>gb', ':GitBlameToggle<CR>', options)

-- split navigation
set_keymap(VimMode.Normal, '<c-j>', '<c-w><c-j>', options)
set_keymap(VimMode.Normal, '<c-k>', '<c-w><c-k>', options)
set_keymap(VimMode.Normal, '<c-l>', '<c-w><c-l>', options)
set_keymap(VimMode.Normal, '<c-h>', '<c-w><c-h>', options)

-- emmet
set_keymap(VimMode.Normal, '<leader>e', ':call emmet#expandAbbr(3, \'\')<CR>', options)
