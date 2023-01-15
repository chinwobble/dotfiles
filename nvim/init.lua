require "user.options"
require "user.keymaps"
require "user.plugins"

vim.cmd [[
source $HOME/.vim/plugin-config/airline.vim
source $HOME/.vim/plugin-config/fugitive.vim
source $HOME/.vim/plugin-config/fold.vim
]]
require "user.colourscheme"
require "user.windows"
require "user.cmp"
require "user.quickfix"

require "user.lsp"
require "user.autopairs"
require "user.treesitter"
require "user.telescope"
