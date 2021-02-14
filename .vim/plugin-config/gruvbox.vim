augroup gruvbox_customisation
  autocmd!
  " make the colour the darker
  autocmd colorscheme gruvbox hi Pmenu ctermbg=235
  autocmd colorscheme gruvbox hi PmenuSel ctermfg=275
  autocmd colorscheme gruvbox hi PmenuSbar ctermbg=235
  autocmd colorscheme gruvbox hi PmenuSbar ctermbg=235
  autocmd colorscheme gruvbox hi GruvboxRedUnderline cterm=underline
  autocmd colorscheme gruvbox hi Visual ctermbg=238
  autocmd colorscheme gruvbox hi cursorLine ctermbg=235
augroup END

" let g:gruvbox_undercurl='0'
let g:gruvbox_invert_selection='0'
let g:gruvbox_contrast_dark = 'hard'
" don't throw error on first run when gruvbox is not installed yet
try
  colorscheme gruvbox
catch /^Vim\%((\a\+)\)\=:E185/
endtry
  " deal with it
  " endtry

" let s:airline_error = [ '#990000', '#000000', 167, 232, '']
" let s:airline_warning = ['#000000', '#df5f00', 232, 166, '']
" let s:theme_palette = g:airline#themes#base16_gruvbox_dark_hard#palette
" let s:theme_palette.normal.airline_error = s:airline_error
" let s:theme_palette.insert.airline_error = s:airline_error
" let s:theme_palette.replace.airline_error = s:airline_error
" let s:theme_palette.terminal.airline_error = s:airline_error
" let s:theme_palette.visual.airline_error = s:airline_error

" let g:airline#themes#base16_gruvbox_dark_hard#palette.airline_error =
"     \ ['#000000', '#990000', 232, 175, '']

" let g:airline#themes#base16_gruvbox_dark_hard#palette.accents =  {
"       \ 'orange': ['#df5f00', '', 166, ''],
"       \ 'bold': ['', '', '', '', 'bold'],
"       \ 'blue': ['#005fff', '', 27, ''],
"       \ 'green': ['#008700', '', 22, ''],
"       \ 'purple': ['#af00df', '', 128, ''],
"       \ 'none': ['', '', '', '', ''],
"       \ 'italic': ['', '', '', '', 'italic'],
"       \ 'yellow': ['#dfff00', '', 190, ''],
"       \ 'red': ['#ff0000', '', 160, '']}
