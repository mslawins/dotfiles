local options = { noremap = true, silent = true }
local set_keymap = vim.api.nvim_set_keymap
local VimMode = { Normal = 'n', Visual = 'v' }
local keymaps_path = '~/.config/nvim/lua/mslawins/keymaps.lua'

-- NVIM KEY MAPS
-- enter - turns off the highlight
set_keymap(VimMode.Normal, '<CR>', ':noh<CR>', options)
-- <leader>k - open keymaps file
set_keymap(VimMode.Normal, '<leader>k', ':e ' .. keymaps_path .. '<CR>', options)

-- half screen jump is always centered
set_keymap(VimMode.Normal, '<C-u>', '<C-u>zz', options)
set_keymap(VimMode.Normal, '<C-d>', '<C-d>zz', options)
set_keymap(VimMode.Normal, 'n', 'nzz', options)
set_keymap(VimMode.Normal, 'N', 'Nzz', options)

-- nvim diagnostics
set_keymap(VimMode.Normal, '<leader>dn', ':lua vim.diagnostic.goto_next()<CR>', options)
set_keymap(VimMode.Normal, '<leader>dp', ':lua vim.diagnostic.goto_prev()<CR>', options)
set_keymap(VimMode.Normal, '<leader>do', ':lua vim.diagnostic.open_float()<CR>', options)

-- LSP
set_keymap(VimMode.Normal, '<leader>gd', ':lua vim.lsp.buf.definition()<CR>', options)

-- split navigation
set_keymap(VimMode.Normal, '<c-j>', '<c-w><c-j>', options)
set_keymap(VimMode.Normal, '<c-k>', '<c-w><c-k>', options)
set_keymap(VimMode.Normal, '<c-l>', '<c-w><c-l>', options)
set_keymap(VimMode.Normal, '<c-h>', '<c-w><c-h>', options)

-- PLUGINS KEY MAPS
-- buffer navigation using commands from 'romgrk/barbar.nvim'
set_keymap(VimMode.Normal, '<tab>', ':BufferNext<CR>', options)
set_keymap(VimMode.Normal, '<s-tab>', ':BufferPrevious<CR>', options)
set_keymap(VimMode.Normal, '<leader>q', ':BufferClose<CR>', options)

-- harpoon
set_keymap(VimMode.Normal, '<leader>h', ':lua require("harpoon.ui").toggle_quick_menu()<CR>', options)
set_keymap(VimMode.Normal, '<leader>ha', ':lua require("harpoon.mark").add_file()<CR>', options)

-- telescope
set_keymap(VimMode.Normal, '<c-f>', ':Telescope find_files<CR>', options)
set_keymap(VimMode.Normal, '<c-g>', ':Telescope live_grep<CR>', options)
set_keymap(VimMode.Normal, '<c-b>', ':Telescope buffers<CR>', options)
-- TODO: need those back for ctrl + d, ctrl + u
-- set_keymap(VimMode.Normal, '<c-d>', ':Telescope diagnostics<CR>', options)
-- set_keymap(VimMode.Normal, '<c-u>', ':Telescope harpoon marks<CR>', options)
set_keymap(VimMode.Normal, '<leader>gs', ':Telescope grep_string<CR>', options)
set_keymap(VimMode.Normal, '<leader>tc', ':TodoTelescope<CR>', options)
set_keymap(VimMode.Visual, '<leader>re', ':Telescope lsp_references<CR>', options)

-- nvim-tree
set_keymap(VimMode.Normal, '<leader>t', ':NvimTreeToggle<CR>', options)
set_keymap(VimMode.Normal, '<leader>tf', ':NvimTreeFindFileToggle<CR>', options)
set_keymap(VimMode.Normal, '<leader>tb', ':NvimTreeResize +20<CR>', options)
set_keymap(VimMode.Normal, '<leader>ts', ':NvimTreeResize -20<CR>', options)
-- display hints for nvim-tree g?

-- nvim-comment
set_keymap(VimMode.Normal, '<leader>c', ':CommentToggle<CR>', options)
set_keymap(VimMode.Visual, '<leader>c', ':CommentToggle<CR>', options)

-- git blame
set_keymap(VimMode.Normal, '<leader>gb', ':GitBlameToggle<CR>', options)

-- emmet
set_keymap(VimMode.Normal, '<leader>e', ':call emmet#expandAbbr(3, \'\')<CR>', options)

-- luasnip
set_keymap(VimMode.Normal, '<leader>ls',
  ':lua require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/lua/mslawins/snippets" })<CR>',
  options)
