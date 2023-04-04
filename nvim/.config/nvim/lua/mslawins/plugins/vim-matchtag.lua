vim.g.vim_matchtag_files = '*.html,*.vue,*.tsx'
vim.g.vim_matchtag_highlight_cursor_on = 1

vim.api.nvim_set_hl(0, 'matchTag', { bg = '#d5c4a1', fg = '#1d2021' })
vim.api.nvim_set_hl(0, 'matchTagError', { bg = '#d5c4a1', fg = '#cc241d' })
