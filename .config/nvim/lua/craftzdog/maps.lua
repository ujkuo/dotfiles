local keymap = vim.keymap

keymap.set('n', 'x', '"_x')

-- Increment/decrement
keymap.set('n', '+', '<C-a>')
keymap.set('n', '-', '<C-x>')

-- Delete a word backwards
keymap.set('n', 'dw', 'vb"_d')

-- Select all
keymap.set('n', '<C-a>', 'gg<S-v>G')

-- Save with root permission (not working for now)
--vim.api.nvim_create_user_command('W', 'w !sudo tee > /dev/null %', {})

-- New tab
keymap.set('n', 'te', ':tabedit')
-- Split window
keymap.set('n', 'ss', ':split<Return><C-w>w')
keymap.set('n', 'sv', ':vsplit<Return><C-w>w')
-- Move window
keymap.set('n', '<Space>', '<C-w>w')
keymap.set('', 'sh', '<C-w>h')
keymap.set('', 'sk', '<C-w>k')
keymap.set('', 'sj', '<C-w>j')
keymap.set('', 'sl', '<C-w>l')

-- Resize window
keymap.set('n', '<C-w><left>', '<C-w><')
keymap.set('n', '<C-w><right>', '<C-w>>')
keymap.set('n', '<C-w><up>', '<C-w>+')
keymap.set('n', '<C-w><down>', '<C-w>-')

--local function t(str)
--    return vim.api.nv--im_replace_termcodes(str, true, true, true)
--end
--
--function _G.smart_tab--()
--    return vim.fn.pum--visible() == 1 and t'<C-N>' or t'<Tab>'
--end
--
--vim.api.nvim_set_keym--ap('i', '<Tab>', 'v:lua.smart_tab()', {expr = true, noremap = true})
vim.api.nvim_set_keymap(
    "n",
    "<shift>",
    "AMLoad nt_en<CR>",
    {
        noremap = true,
        silent = true
    }
)
