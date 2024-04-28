require('nvim-treesitter.configs').setup {
  ensure_installed = {
    'css',
    'html',
    'javascript',
    'lua',
    'markdown',
    'markdown_inline',
    'rust',
    'scss',
    'sql',
    'typescript',
    'vue',
  },
  sync_install = false,
  auto_install = true,
  highlight = { enable = true },
}
