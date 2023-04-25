local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

local actions = require("telescope.actions")
local telescope_builtin = require('telescope.builtin')
local M = {}

telescope.setup {
    defaults = {
        file_ignore_patterns = { "^.git/" },
        prompt_prefix = "🔍 ",
    },
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

-- See `:help telescope.builtin`
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer' })

vim.keymap.set('n', '<Leader>p', 
    ':lua require\'deepak.telescope\'.project_files()<Cr>', {desc= "Search [P]roject"}, 
        {noremap = true, silent = true})

vim.keymap.set('n', '<Leader>df', 
    ':lua require\'deepak.telescope\'.search_dotfiles()<Cr>', {desc="Search [D]ot [F]iles"},
        {noremap = true, silent = true})

vim.keymap.set('n', '<Leader>ff', 
    ':lua require\'telescope.builtin\'.find_files()<Cr>', {desc="[F]ind [F]iles"},
        {noremap = true, silent = true})

vim.keymap.set('n', '<Leader>fg', 
    ':lua require\'telescope.builtin\'.live_grep()<Cr>', {desc="[F]ind by [G]rep}"},
        {noremap = true, silent = true})

vim.keymap.set('n', '<Leader>sh', 
    ':lua require\'telescope.builtin\'.help_tags()<Cr>',{desc="[S]earch[H]elp"}, 
        {noremap = true, silent = true})

return M
