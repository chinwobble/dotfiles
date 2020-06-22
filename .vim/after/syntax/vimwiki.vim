syntax match todoCheckbox "\[\ \]" conceal cchar=
" syntax match todoCheckbox "\[x\]" conceal cchar=
" syntax match todoCheckbox "\[X\]" conceal cchar=
call matchadd('Conceal', '\[\ \]', 0, 11, {'conceal': ''})
call matchadd('Conceal', '\[X\]', 0, 12, {'conceal': ''})
hi def link todoCheckbox Todo
hi Conceal guibg=NONE
