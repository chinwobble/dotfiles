" shorten the display
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
  let g:airline_symbols.branch = ''
  let g:airline_symbols.linenr = ''
endif

" let g:airline_theme='gruvbox_dark_hard'
let g:airline_section_z = "%p%%%4l:%3v"
let g:airline_mode_map = {
      \ '__'     : '-',
      \ 'c'      : 'C',
      \ 'i'      : 'I',
      \ 'ic'     : 'I',
      \ 'ix'     : 'I',
      \ 'n'      : 'N',
      \ 'multi'  : 'M',
      \ 'ni'     : 'N',
      \ 'no'     : 'N',
      \ 'R'      : 'R',
      \ 'Rv'     : 'R',
      \ 's'      : 'S',
      \ 'S'      : 'S',
      \ ''     : 'S',
      \ 't'      : 'T',
      \ 'v'      : 'V',
      \ 'V'      : 'V',
      \ ''     : 'V',
      \ }
let airline#extensions#coc#stl_format_err = '%E'

let airline#extensions#coc#stl_format_warn = '%W'
let airline#extensions#coc#error_symbol = ''
let airline#extensions#coc#warning_symbol = ''
let airline#extensions#ale#error_symbol = ''
let airline#extensions#ale#warning_symbol = ''
let airline#extensions#whitespace#show_message = 0

if has('unix')
  let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'
else
  let g:airline#parts#ffenc#skip_expected_string='utf-8[dos]'
endif

" added to improve startup time
" https://github.com/neoclide/coc.nvim/issues/1827
let g:airline#extensions#hunks#enabled = 0
let airline#extensions#ale#show_line_numbers = 0
let g:airline_section_x = airline#section#create(
      \[
      \"%{get(b:,'coc_current_function', '')}"
      \])


" %{airline#util#prepend("",0)}
" %{airline#util#prepend("",0)}
" %{airline#util#prepend("",0)}
" %{airline#util#prepend(airline#extensions#omnisharp#server_status(),0)}
" %{airline#util#prepend("",0)}
" %{airline#util#wrap(airline#parts#filetype(),0)}
"
