" syntax match todoCheckbox "\[x\]" conceal cchar=
" syntax match todoCheckbox "\[X\]" conceal cchar=
call matchadd('Conceal', '\[\ \]', 0, -1, {'conceal': ''})
call matchadd('Conceal', '\[X\]', 0, -1, {'conceal': ''})
hi def link todoCheckbox Todo
hi Conceal guibg=NONE

set concealcursor=nc
