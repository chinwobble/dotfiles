" let g:gruvbox_undercurl='0'
let g:gruvbox_invert_selection='0'

" don't throw error on first run when gruvbox is not installed yet
try
  colorscheme gruvbox
catch /^Vim\%((\a\+)\)\=:E185/
endtry
  " deal with it
  " endtry
