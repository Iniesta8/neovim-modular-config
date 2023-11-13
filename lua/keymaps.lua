-- [[ Basic Keymaps ]]

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Helpers
vim.keymap.set('n', '<leader>w', ':w<CR>', { noremap = true })
vim.keymap.set('n', '<leader>W', ':w!<CR>', { noremap = true })
vim.keymap.set('n', '<leader>q', ':q!<CR>', { noremap = true })
vim.keymap.set('n', '<leader>Q', ':bd<CR>', { noremap = true })
vim.keymap.set('n', '<leader>,', '<C-^>', { noremap = true })
-- vim.keymap.set('n', '<leader>fc', '/\\v^[<\\|=>]{7}( .*\\|$)<CR>', { noremap = true }) -- find merge conflict markers
vim.keymap.set('n', 'vs', ':vs<CR>', { noremap = true, silent = true })
vim.keymap.set('n', 'sp', ':sp<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-L>', '<C-W><C-L>', { noremap = true })
vim.keymap.set('n', '<C-H>', '<C-W><C-H>', { noremap = true })
vim.keymap.set('n', '<C-K>', '<C-W><C-K>', { noremap = true })
vim.keymap.set('n', '<C-J>', '<C-W><C-J>', { noremap = true })
-- vim.keymap.set('n', '<C-S>', ':%s/', { noremap = true })
vim.keymap.set('n', '<C-N>', ':Lexplore<CR> :vertical resize 30<CR>', { noremap = true, silent = true })
vim.keymap.set("n", '<leader>t', ':sp<CR> :term<CR> :resize 20N<CR> i', { noremap = true, silent = true })
vim.keymap.set("n", 'J', 'mzJ`z', { noremap = true })

-- Move code blocks
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { noremap = true })
vim.keymap.set('v', 'K', ":m '>-2<CR>gv=gv", { noremap = true })

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
-- vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- Some old functions and configurations that I used in the past

vim.keymap.set('n', 'Q', '<nop>')

vim.cmd([[
  " Strip trailing whitespace (,ss)
  function! StripWhitespace ()
    let save_cursor = getpos('.')
    let old_query = getreg('/')
    :%s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
  endfunction
  nnoremap <leader>ss :call StripWhitespace()<CR>
]])

-- vim: ts=2 sts=2 sw=2 et
