vim.o.smarttab = true
vim.o.expandtab = true
vim.o.tabstop = 4
vim.o.smartindent = true
vim.o.shiftwidth = 4
-- Show number
vim.o.number = true
-- Encodings
vim.o.encoding = 'utf-8'
vim.o.fileencodings = 'utf-8,iso-2022-jp,euc-jp,sjis'
-- Split directions
vim.o.splitright = true
vim.o.splitbelow = true
-- Persistent undo
vim.o.undodir = vim.env.HOME .. '/.config/nvim/undo'
vim.o.undofile = true
-- Clipboard (mac)
if jit.os == "Darwin" then
  vim.o.clipboard = 'unnamed'
end
-- Do not hide quote of JSON
vim.o.conceallevel = 0
-- auto reload
vim.o.autoread = true

-- Indent Settings
vim.cmd('augroup filetypedetect')
vim.cmd('autocmd!')
vim.cmd('autocmd FileType yaml setlocal ts=2 sts=2 sw=2')
vim.cmd('autocmd FileType sh setlocal ts=2 sts=2 sw=2')
vim.cmd('autocmd FileType ruby setlocal ts=2 sts=2 sw=2')
vim.cmd('autocmd FileType zsh setlocal ts=2 sts=2 sw=2')
vim.cmd('autocmd FileType tf setlocal ts=2 sts=2 sw=2')
vim.cmd('autocmd FileType vim setlocal ts=2 sts=2 sw=2')
vim.cmd('autocmd FileType typescript setlocal ts=2 sts=2 sw=2')
vim.cmd('autocmd FileType typescriptreact setlocal ts=2 sts=2 sw=2')
vim.cmd('autocmd FileType json setlocal ts=2 sts=2 sw=2')
vim.cmd('autocmd FileType markdown setlocal ts=2 sts=2 sw=2')
vim.cmd('autocmd FileType go setlocal noexpandtab')
vim.cmd('augroup END')
