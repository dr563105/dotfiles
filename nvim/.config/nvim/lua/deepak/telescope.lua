local telescope = require('telescope')
local actions = require("telescope.actions")
local telescope_builtin = require('telescope.builtin')
local M = {}

telescope.setup {
    extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    },
  },
}
-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
telescope.load_extension('fzf')

-- Quickly search dotfiles from anywhere
M.search_dotfiles = function()
        telescope_builtin.find_files({
        prompt_title = "< Dotfiles >",
        cwd = '~/.dotfiles',
        file_ignore_patterns = {'.git'},
        hidden = true
    })
end

M.project_files = function()
  local opts = {} -- define here if you want to define something
  local ok = pcall(require"telescope.builtin".git_files, opts)
  if not ok then require"telescope.builtin".find_files(opts) end
end

-- Toggle preview floating screen/buffer
local action_layout = require("telescope.actions.layout")
require("telescope").setup{
  defaults = {
    mappings = {
      n = {
        ["<M-p>"] = action_layout.toggle_preview
      },
      i = {
        ["<M-p>"] = action_layout.toggle_preview
      },
    },
  }
}

vim.api.nvim_set_keymap('n', '<Leader>p', ':lua require\'deepak.telescope\'.project_files()<Cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>df', ':lua require\'deepak.telescope\'.search_dotfiles()<Cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>ff', ':lua require\'telescope.builtin\'.find_files()<Cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>fg', ':lua require\'telescope.builtin\'.live_grep()<Cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>fb', ':lua require\'telescope.builtin\'.buffers()<Cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>fh', ':lua require\'telescope.builtin\'.help_tags()<Cr>', {noremap = true, silent = true})

return M
