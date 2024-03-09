-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
-- vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Helpers
vim.keymap.set('n', '<leader>w', ':w<CR>', { noremap = true })
vim.keymap.set('n', '<leader>W', ':w!<CR>', { noremap = true })
vim.keymap.set('n', '<leader>q', ':q!<CR>', { noremap = true })
vim.keymap.set('n', '<leader>Q', ':bd<CR>', { noremap = true })
vim.keymap.set('n', '<leader>,', '<C-^>', { noremap = true })
vim.keymap.set('n', 'Q', '<nop>')

-- vim.keymap.set('n', '<leader>fc', '/\\v^[<\\|=>]{7}( .*\\|$)<CR>', { noremap = true }) -- find merge conflict markers

vim.keymap.set('n', 'vs', ':vs<CR>', { noremap = true, silent = true })
vim.keymap.set('n', 'sp', ':sp<CR>', { noremap = true, silent = true })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- vim.keymap.set('n', '<C-S>', ':%s/', { noremap = true })
vim.keymap.set('n', '<C-N>', ':Lexplore<CR> :vertical resize 30<CR>', { noremap = true, silent = true })
vim.keymap.set("n", '<leader>t', ':sp<CR> :term<CR> :resize 20N<CR> i', { noremap = true, silent = true })
vim.keymap.set("n", 'J', 'mzJ`z', { noremap = true })

-- Move code blocks
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { noremap = true })
vim.keymap.set('v', 'K', ":m '>-2<CR>gv=gv", { noremap = true })

vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Strip trailing whitespaces (,ss)
vim.cmd([[
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
