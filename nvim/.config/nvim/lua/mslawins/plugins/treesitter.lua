require('nvim-treesitter.configs').setup {
  ensure_installed = { 'typescript', 'javascript', 'rust', 'lua', 'html', 'scss', 'css', 'vue', 'markdown', 'sql', 'markdown_inline' },
  sync_install = false,
  auto_install = true,
  highlight = { enable = true },
}
