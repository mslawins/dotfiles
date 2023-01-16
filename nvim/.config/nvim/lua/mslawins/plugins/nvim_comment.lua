require('nvim_comment').setup({
  create_mappings = false,
  -- this hook sets commentstring based on treesitter in buffers with multiple filetypes
  hook = function()
    if vim.api.nvim_buf_get_option(0, 'filetype') == 'vue' then
      require('ts_context_commentstring.internal').update_commentstring()
    end

    if vim.api.nvim_buf_get_option(0, 'filetype') == 'json' then
      vim.api.nvim_buf_set_option(0, 'commentstring', '// %s')
    end
  end,
})
