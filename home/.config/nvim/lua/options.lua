local opt = vim.opt
local opt_global = vim.go


--------------------------
-- Local and Global (set)
--------------------------

-- Show number
opt.number = true
-- Encodings
opt.encoding = 'utf-8'
opt.fileencodings = 'utf-8,iso-2022-jp,euc-jp,sjis'
-- Split directions
opt.splitright = true
opt.splitbelow = true
-- Persistent undo
opt.undodir = vim.env.HOME .. '/.config/nvim/undo'
opt.undofile = true
-- Clipboard (mac)
if jit.os == "Darwin" then
  opt.clipboard = 'unnamed'
end
-- Do not hide quote of JSON
opt.conceallevel = 0
-- auto reload
opt.autoread = true


----------------------
-- Global (setglobal)
----------------------

-- Indent
opt_global.smarttab = true
opt_global.expandtab = true
opt_global.tabstop = 4
opt_global.smartindent = true
opt_global.shiftwidth = 4
