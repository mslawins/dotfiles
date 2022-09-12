vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = false,
  float = {
    border = 'single',
    format = function(diagnostic)
      return string.format('%s (%s) [%s]', diagnostic.message, diagnostic.source,
                           diagnostic.code or diagnostic.user_data.lsp.code)
    end,
  },
})
