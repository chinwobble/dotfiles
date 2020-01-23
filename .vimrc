let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"
filetype indent plugin on
set nocompatible
syntax on
set path+=**
set wildmenu

let g:ale_fixers = ['prettier', 'eslint']
let g:ale_fix_on_save = 1
set incsearch
let g:OmniSharp_server_path = 'C:\OmniSharp\omnisharp.win-x64\OmniSharp.exe'
let g:OmniSharp_server_stdio = 1
let g:OmniSharp_highlight_types = 3
let g:OmniSharp_highlight_groups = {
                        \ 'csUserIdentifier': [
                        \   'constant name', 'enum member name', 'field name', 'identifier',
                        \   'local name', 'parameter name', 'property name', 'static symbol'],
                        \ 'csUserInterface': ['interface name'],
                        \ 'csUserMethod': ['extension method name', 'method name'],
                        \ 'csUserType': ['class name', 'enum name', 'namespace name', 'struct name']
                        \}
