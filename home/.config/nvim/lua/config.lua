vim.cmd('augroup MyAutoCmd')
vim.cmd('autocmd!')
vim.cmd('augroup END')

vim.cmd('syntax enable')
vim.cmd('syntax on')

require('options')
require('plugins.dein')