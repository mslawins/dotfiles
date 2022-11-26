local actions = require('telescope.actions')
local action_state = require('telescope.actions.state')

local multiopen = function(prompt_bufnr, open_cmd)
  local picker = action_state.get_current_picker(prompt_bufnr)
  local num_selections = #picker:get_multi_selection()
  if not num_selections or num_selections <= 1 then
    actions.add_selection(prompt_bufnr)
  end
  actions.send_selected_to_qflist(prompt_bufnr)

  local results = vim.fn.getqflist()

  for _, result in ipairs(results) do
    local current_file = vim.fn.bufname()
    local next_file = vim.fn.bufname(result.bufnr)

    if current_file == '' then
      vim.api.nvim_command('BufferClose')
    end
    vim.api.nvim_command(open_cmd .. ' ' .. next_file)
  end

  vim.api.nvim_command('BufferOrderByBufferNumber')
end

local function multi_selection_open(prompt_bufnr)
  multiopen(prompt_bufnr, 'edit')
end

local mappings = {
  ['<ESC>'] = actions.close,
  ['<TAB>'] = actions.toggle_selection + actions.move_selection_previous,
  ['<S-TAB>'] = actions.toggle_selection + actions.move_selection_next,
  ['<CR>'] = multi_selection_open,
}

require('telescope').setup({
  defaults = { layout_config = { height = 0.95, width = 0.90, preview_width = 0.5 } },
  pickers = { find_files = { mappings = { i = mappings, n = mappings } } },
})
require('telescope').load_extension('fzf')
require('telescope').load_extension('luasnip')
require('telescope').load_extension('harpoon')
