call plug#begin('~/.vim/plugged')
Plug 'rafcamlet/coc-nvim-lua'
Plug 'dense-analysis/ale'
Plug 'omnisharp/omnisharp-vim'
Plug 'terryma/vim-expand-region'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
Plug 'jremmen/vim-ripgrep'
Plug 'morhetz/gruvbox'
Plug 'sheerun/vim-polyglot'
Plug 'airblade/vim-rooter'
Plug 'editorconfig/editorconfig-vim'
Plug 'honza/vim-snippets'
Plug 'Yggdroot/indentLine'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ctrlpvim/ctrlp.vim'
" Plug 'godlygeek/tabular'
Plug 'vimwiki/vimwiki', {'branch': 'dev'}
Plug 'AndrewRadev/quickpeek.vim'
Plug 'n0v1c3/vira', { 'do': './install.sh', 'branch': 'dev' }
call plug#end()

" needed to get cursor block in mingw64 let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"
filetype indent plugin on
set nocompatible
syntax on
set signcolumn=yes " always show sign column so it doesn't shifting the text
set ignorecase
set backspace=indent,eol,start
set path+=**
set wildmenu
set wildignore+=*/node_modules/*
set wildignore+=_site,*/__pycache__/,*/venv/*,*/target/*,*/.vim$,\~$,*/.log,*/.aux,*/.cls,*/.aux,*/.bbl,*/.blg,*/.fls,*/.fdb*/,*/.toc,*/.out,*/.glo,*/.log,*/.ist,*/.fdb_latexmk
set wildignore+=*/bin/*,*/obj/*
set ruler
set number
set expandtab
set sts=2
set shiftwidth=2
set clipboard=unnamed
set encoding=utf8
set incsearch
" allow <C-A> and <C-X> to increment letters
set nrformats+=alpha
" navigate vim windows
set winminheight=0
map <C-J> <C-W>j
map <C-K> <C-W>k

" Map Ctrl-Backspace to delete the previous word in insert mode.
inoremap <C-BS> <C-\><C-o>db
" change to working directory to current file
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>

" Don't save backups in working directory
set backupdir=~/.vim/tmp
set directory=~/.vim/swp

" ctrl-s to save
nmap <C-s> :w<CR>
imap <C-s> <esc>:w<CR>

" hotkeys to move lines up and down
vnoremap <A-j> :m '>+1<CR>gv=gv
inoremap <A-k> <Esc>:m .-2<CR>==gi
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
vnoremap <A-k> :m '<-2<CR>gv=gv

" open vimrc
nnoremap <Leader>ev :e ~/dotfiles/.vimrc<CR>

" close both files for a diff
nnoremap <silent> <leader>q :quitall<CR>

source $HOME/.vim/plugin-config/coc.vim
source $HOME/.vim/plugin-config/vira.vim
" WSL yank support

let s:clip = "/mnt/c/Windows/System32/clip.exe"
if executable(s:clip)
  noremap "+p :exe 'norm a'.system('/mnt/c/Windows/System32/WindowsPowerShell/v1.0/powershell.exe -Command Get-Clipboard')<CR>
  augroup wslyank
    autocmd!
    autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
  augroup end
endif
" indentline {{{1 "
let g:indentLine_showFirstIndentLevel = 1
let g:indentLine_setConceal = 0
set conceallevel=2
set concealcursor=inc
" rooter {{{1
let g:rooter_silent_chdir = 1


" ale config {{{1
let g:ale_disable_lsp = 1
let g:ale_sign_column_always = 1
let g:ale_sign_error = '>'
let g:ale_sign_warning = '-'
let g:ale_sign_info = '-'

let g:ale_fixers = {
  \ '*': ['remove_trailing_lines', 'trim_whitespace'],
  \ 'javascript': ['prettier', 'eslint'],
  \ 'typescript': ['prettier', 'eslint'],
  \ 'yaml': ['prettier'],
  \ }
let g:ale_linters = {
  \ 'cs': ['omnisharp'],
  \}
let g:ale_fix_on_save = 1
let g:ale_pattern_options = {
        \ '.*\.py$': {'ale_enabled': 0},
        \ '.*\.md$': {'ale_enabled': 0}}

set completeopt=longest,menuone,preview

" omnisharp {{{1
let g:OmniSharp_server_stdio = 1
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
augroup omnisharp_commands
    autocmd!
"
"     " Show type information automatically when the cursor stops moving.
"     " Note that the type is echoed to the Vim command line, and will overwrite
"     " any other messages in this space including e.g. ALE linting messages.
     autocmd CursorHold *.cs :OmniSharpTypeLookup
"
"     autocmd FileType cs nnoremap <buffer> gd :OmniSharpGotoDefinition<CR>
"     autocmd FileType cs nnoremap <buffer> <Leader>fi :OmniSharpFindImplementations<CR>
"     autocmd FileType cs nnoremap <buffer> <Leader>fs :OmniSharpFindSymbol<CR>
"     autocmd FileType cs nnoremap <buffer> <Leader>fu :OmniSharpFindUsages<CR>
"
"     " The following commands are contextual, based on the cursor position.
"     " Finds members in the current buffer
"     autocmd FileType cs nnoremap <buffer> <Leader>fm :OmniSharpFindMembers<CR>
"
"     autocmd FileType cs nnoremap <buffer> <Leader>fx :OmniSharpFixUsings<CR>
"     autocmd FileType cs nnoremap <buffer> <Leader>tt :OmniSharpTypeLookup<CR>
"     autocmd FileType cs nnoremap <buffer> <Leader>dc :OmniSharpDocumentation<CR>
"     autocmd FileType cs nnoremap <buffer> <C-\> :OmniSharpSignatureHelp<CR>
"     autocmd FileType cs inoremap <buffer> <C-\> <C-o>:OmniSharpSignatureHelp<CR>
"
"     " Navigate up and down by method/property/field
"     autocmd FileType cs nnoremap <buffer> <C-k> :OmniSharpNavigateUp<CR>
"     autocmd FileType cs nnoremap <buffer> <C-j> :OmniSharpNavigateDown<CR>
"
"     " Find all code errors/warnings for the current solution and populate the quickfix window
"     autocmd FileType cs nnoremap <buffer> <Leader>cc :OmniSharpGlobalCodeCheck<CR>
augroup END

" Contextual code actions (uses fzf, CtrlP or unite.vim when available)
nnoremap <Leader><Space> :OmniSharpGetCodeActions<CR>
" Run code actions with text selected in visual mode to extract method
xnoremap <Leader><Space> :call OmniSharp#GetCodeActions('visual')<CR>
nnoremap <Leader>cf :OmniSharpCodeFormat<CR>

" Start the omnisharp server for the current solution
nnoremap <Leader>ss :OmniSharpStartServer<CR>
nnoremap <Leader>sp :OmniSharpStopServer<CR>

" Enable snippet completion
" let g:OmniSharp_want_snippet=1

" airline {{{1
" shorten the display
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
  let g:airline_symbols.branch = ''
  let g:airline_symbols.linenr = ''
endif

let g:airline_theme='base16_gruvbox_dark_hard'
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
let g:airline#parts#ffenc#skip_expected_string='utf-8[dos]'

" added to improve startup time
" https://github.com/neoclide/coc.nvim/issues/1827
let g:airline#extensions#hunks#enabled = 0
let airline#extensions#ale#show_line_numbers = 0

" vimwiki {{{1
let g:vimwiki_key_mappings =
    \ {
    \ 'headers': 0,
    \ 'table_mappings': 0,
    \ }

let g:vimwiki_hl_cb_checked = 2
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


" configure folds and correct zo and zc behaviour {{{1
autocmd Syntax c,csharp,cpp,xml,html,json setlocal foldmethod=syntax
autocmd Syntax vim setlocal foldmethod=marker
autocmd Syntax vim setlocal foldlevel=0
autocmd Syntax c,csharp,cpp,xml,html,json normal zR
autocmd Syntax yaml setlocal foldmethod=indent
autocmd Syntax yaml normal zR

" change fold text to display contents
" https://dhruvasagar.com/2013/03/28/vim-better-foldtext
function! NeatFoldText()
  let line = ' ' . substitute(getline(v:foldstart), '^\\s*\"\\?\\s*\\|\\s*\"\\?\\s*{{' . '{\\d*\\s*', '', 'g') . ' '
  let lines_count = v:foldend - v:foldstart + 1
  let lines_count_text = '| ' . printf("%10s\", lines_count . '
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
  let sub = strpart(sub, 0, winwidth(0) - strlen( info ) - num_w - fold_w - 1 )
  return sub . info
endfunction

" fugitive {{{1
" cnoremap git Git
map <leader>ga :Gwrite<CR>
map <leader>gc :Gcommit<CR>
map <leader>gp :Git push<CR>
function! GitPushSetUpstream() abort
  echo "Pushing..."
  exe 'Git push -u origin ' . FugitiveHead()
  echo "Pushed! 🤩"
endfunction

command! Gp call GitPushSetUpstream()
nmap <leader>gp :call GitPushSetUpstream()<cr>
nmap <leader>gj :diffget //3<CR>
nmap <leader>gf :diffget //2<CR>
nmap <leader>gs :G<CR>

if filereadable($HOME . '/.vimrc.local')
    source ~/.vimrc.local
endif
" ctrlp {{{1
let g:ctrlp_extensions = ['tag', 'buffertag', 'quickfix',
                          \ 'undo', 'line', 'changes', 'mixed', 'bookmarkdir']

" exclude dotnet build artifacts
let g:ctrlp_custom_ignore = 'bin\|obj\|git\|DS_Store\|node_modules\|_build\|esy.lock\|_esy'

" dracula {{{1
let g:dracula_italic = 0
augroup dracula_customisation
  au!
  autocmd colorscheme dracula hi link AleWarning DraculaWarnLine
  autocmd colorscheme dracula hi link AleWarningSign DraculaOrangeInverse
  autocmd Colorscheme dracula let g:dracula#palette.comment = ['#5272a3',  61]
  autocmd colorscheme dracula hi link CocErrorHighlight DraculaErrorLine
  autocmd colorscheme dracula hi link CocWarningHighlight DraculaWarnLine
augroup END

" quickfix {{{1
augroup quickfix
  autocmd!
  autocmd QuickFixCmdPost [^l]* nested cwindow
  autocmd QuickFixCmdPost    l* nested lwindow
augroup END
" open new windows except quickfix maximised
autocmd WinEnter * if &buftype == 'quickfix' | wincmd J | resize 9 |else | wincmd _ | endif

let g:quickpeek_auto = v:true
" use a slightly darker background, like GitHub inline code blocks
let g:github_colors_soft = 1

colorscheme gruvbox
set background=dark

" rooter {{{1
" add extra root markers to support mono repos..
" Many apps exit in the same mono repo and you don't want to keep changing to
" the root
let g:rooter_patterns = ['requirements.txt', 'Pipfile', '.git', 'Makefile']
let g:ctrlp_root_markers = ['requirements.txt', 'Pipfile']
