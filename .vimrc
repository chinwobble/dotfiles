" needed to get cursor block in mingw64
let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"
filetype indent plugin on
set nocompatible
syntax on
set backspace=indent,eol,start
set path+=**
set wildmenu
set ruler
set number
set shiftwidth=4
set clipboard=unnamed

" navigate vim windows
set winminheight=0
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_

let g:ale_fixers = {
    \ 'javascript': ['prettier', 'eslint'],
    \ 'typescript': ['prettier', 'eslint'],
    \ 'yaml': ['prettier'],
    \ }
let g:ale_linters = {'cs': ['omnisharp']}
let g:ale_fix_on_save = 1
set incsearch
let g:OmniSharp_server_stdio = 1
set completeopt=longest,menuone,preview
let g:omnicomplete_fetch_full_documentation = 1
let g:OmniSharp_highlight_types = 3
let g:OmniSharp_highlight_groups = {
    \ 'csUserIdentifier': [
    \   'constant name', 'enum member name', 'field name', 'identifier',
    \   'local name', 'parameter name', 'property name', 'static symbol'],
    \ 'csUserInterface': ['interface name'],
    \ 'csUserMethod': ['extension method name', 'method name'],
    \ 'csUserType': ['class name', 'enum name', 'namespace name', 'struct name']
    \}

let g:OmniSharp_highlight_types = 3
" exclude dotnet build artifacts
let g:ctrlp_custom_ignore = 'bin\|obj\|git\|DS_Store\|node_modules' 

autocmd GUIEnter * simalt ~x

augroup omnisharp_commands
    autocmd!

    " Show type information automatically when the cursor stops moving.
    " Note that the type is echoed to the Vim command line, and will overwrite
    " any other messages in this space including e.g. ALE linting messages.
    autocmd CursorHold *.cs OmniSharpTypeLookup

    autocmd FileType cs nnoremap <buffer> gd :OmniSharpGotoDefinition<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fi :OmniSharpFindImplementations<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fs :OmniSharpFindSymbol<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fu :OmniSharpFindUsages<CR>

    " The following commands are contextual, based on the cursor position.
    " Finds members in the current buffer
    autocmd FileType cs nnoremap <buffer> <Leader>fm :OmniSharpFindMembers<CR>

    autocmd FileType cs nnoremap <buffer> <Leader>fx :OmniSharpFixUsings<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>tt :OmniSharpTypeLookup<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>dc :OmniSharpDocumentation<CR>
    autocmd FileType cs nnoremap <buffer> <C-\> :OmniSharpSignatureHelp<CR>
    autocmd FileType cs inoremap <buffer> <C-\> <C-o>:OmniSharpSignatureHelp<CR>

    " Navigate up and down by method/property/field
    autocmd FileType cs nnoremap <buffer> <C-k> :OmniSharpNavigateUp<CR>
    autocmd FileType cs nnoremap <buffer> <C-j> :OmniSharpNavigateDown<CR>

    " Find all code errors/warnings for the current solution and populate the quickfix window
    autocmd FileType cs nnoremap <buffer> <Leader>cc :OmniSharpGlobalCodeCheck<CR>
augroup END
autocmd FileType yml,json setlocal shiftwidth=2 sts=2 tabstop=2
autocmd FileType vimwiki setlocal concealcursor=nv
autocmd FileType markdown setlocal shiftwidth=2 sts=2 tabstop=2

" Contextual code actions (uses fzf, CtrlP or unite.vim when available)
nnoremap <Leader><Space> :OmniSharpGetCodeActions<CR>
" Run code actions with text selected in visual mode to extract method
xnoremap <Leader><Space> :call OmniSharp#GetCodeActions('visual')<CR>

" Rename with dialog
nnoremap <Leader>nm :OmniSharpRename<CR>
nnoremap <F2> :OmniSharpRename<CR>
" Rename without dialog - with cursor on the symbol to rename: `:Rename newname`
command! -nargs=1 Rename :call OmniSharp#RenameTo("<args>")

nnoremap <Leader>cf :OmniSharpCodeFormat<CR>

" Start the omnisharp server for the current solution
nnoremap <Leader>ss :OmniSharpStartServer<CR>
nnoremap <Leader>sp :OmniSharpStopServer<CR>

" ctrl-s to save
nmap <C-s> <esc>:w<CR>
imap <C-s> <esc>:w<CR>

" Enable snippet completion
" let g:OmniSharp_want_snippet=1

" hotkeys to move lines up and down
vnoremap <A-j> :m '>+1<CR>gv=gv
inoremap <A-k> <Esc>:m .-2<CR>==gi
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
vnoremap <A-k> :m '<-2<CR>gv=gv

" open vimrc
nnoremap <Leader>ev :e ~/.vimrc<CR>

" close both files for a diff
nnoremap <silent> <leader>q :quitall<CR>

" airline
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

let g:vimwiki_list = [
  \ { 'auto_toc': 1, 
  \ 'auto_tags': 1, 
  \ 'auto_diary_index': 1, 
  \ 'path': '~/vimwiki/',
  \ 'syntax': 'markdown', 
  \ 'ext': '.md' },
  \ { 'auto_toc': 1, 
  \ 'auto_tags': 1, 
  \ 'auto_diary_index': 1, 
  \ 'path': '~/wiki',
  \ 'index': 'README',
  \ 'syntax': 'markdown', 
  \ 'ext': '.md' }
  \ ]

" allow <C-A> and <C-X> to increment letters
set nrformats+=alpha

" configure folds and correct zo and zc behaviour
autocmd Syntax c,csharp,cpp,vim,xml,html,json setlocal foldmethod=syntax
autocmd Syntax c,csharp,cpp,vim,xml,html,json normal zR
autocmd Syntax yaml setlocal foldmethod=indent
autocmd Syntax yaml normal zR

" change fold text to display contents
" https://dhruvasagar.com/2013/03/28/vim-better-foldtext
function! NeatFoldText()
  let line = ' ' . substitute(getline(v:foldstart), '^\\s*\"\\?\\s*\\|\\s*\"\\?\\s*{{' . '{\\d*\\s*', '', 'g') . ' '
  let lines_count = v:foldend - v:foldstart + 1
  let lines_count_text = '| ' . printf(\"%10s\", lines_count . ' lines') . ' |'
  let foldchar = matchstr(&amp;fillchars, 'fold:\\zs.')
  let foldtextstart = strpart('+' . repeat(foldchar, v:foldlevel*2) . line, 0, (winwidth(0)*2)/3)
  let foldtextend = lines_count_text . repeat(foldchar, 8)
  let foldtextlength = strlen(substitute(foldtextstart . foldtextend, '.', 'x', 'g')) + &amp;foldcolumn
  return foldtextstart . repeat(foldchar, winwidth(0)-foldtextlength) . foldtextend
endfunction

" when folded, show the first comment or first line of the fold
" https://vim.fandom.com/wiki/Customize_text_for_closed_folds
set foldtext=MyFoldText()
function! MyFoldText()
  let line = getline(v:foldstart)
  if match( line, '^[ \t]*\(\/\*\|\/\/\)[*/\\]*[ \t]*$' ) == 0
    let initial = substitute( line, '^\([ \t]\)*\(\/\*\|\/\/\)\(.*\)', '\1\2', '' )
    let linenum = v:foldstart + 1
    while linenum < v:foldend
      let line = getline( linenum )
      let comment_content = substitute( line, '^\([ \t\/\*]*\)\(.*\)$', '\2', 'g' )
      if comment_content != ''
        break
      endif
      let linenum = linenum + 1
    endwhile
    let sub = initial . ' ' . comment_content
  else
    let sub = line
    let startbrace = substitute( line, '^.*{[ \t]*$', '{', 'g')
    if startbrace == '{'
      let line = getline(v:foldend)
      let endbrace = substitute(line, '^[ \t]*}\(.*\)$', '}', 'g')
      if endbrace == '}'
        let nextline = getline(v:foldstart + 1)
        let filler = substitute(nextline, '^[ \t]*', '', 'g')
        let sub = sub.substitute(line, '^[ \t]*}\(.*\)$', filler . ' ...}', 'g')
      endif
    endif
  endif
  let n = v:foldend - v:foldstart + 1
  let info = " " . n . " lines"
  let sub = sub . "                                                                                                                  "
  let num_w = getwinvar( 0, '&number' ) * getwinvar( 0, '&numberwidth' )
  let fold_w = getwinvar( 0, '&foldcolumn' )
  let sub = strpart( sub, 0, winwidth(0) - strlen( info ) - num_w - fold_w - 1 )
  return sub . info
endfunction
