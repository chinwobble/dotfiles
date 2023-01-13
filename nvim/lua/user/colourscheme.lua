vim.opt.background = "dark" -- or "light" for light mode

vim.cmd [[
augroup gruvbox_customisation
  autocmd!
  " make the colour the darker
  autocmd colorscheme gruvbox hi ToolbarButton ctermbg=235
  autocmd colorscheme gruvbox hi Pmenu ctermbg=235
  " change PmenuSel from low contrast to high contrast
  autocmd colorscheme gruvbox hi PmenuSel ctermfg=276 ctermbg=238 guibg=#665c54
  autocmd colorscheme gruvbox hi PmenuSbar ctermbg=235
  autocmd colorscheme gruvbox hi GruvboxRedUnderline cterm=underline
  autocmd colorscheme gruvbox hi Visual ctermbg=238
  autocmd colorscheme gruvbox hi cursorLine ctermbg=235
  " fix an issue with bad highlighting in floating windows
  autocmd colorscheme gruvbox hi clear Error
  " make the quickfix selection the same as pmenu selection and not gold
  autocmd colorscheme gruvbox hi QuickFixLine cterm=bold ctermfg=276 ctermbg=238 gui=bold guifg=#504945 guibg=#665c54
augroup END
let g:gruvbox_invert_selection='0'
let g:gruvbox_contrast_dark = 'hard'
]]

vim.cmd([[colorscheme gruvbox]])
