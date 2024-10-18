call plug#begin('~/.vim/plugged')
Plug 'rafcamlet/coc-nvim-lua'
Plug 'dense-analysis/ale'
Plug 'omnisharp/omnisharp-vim'
Plug 'terryma/vim-expand-region'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
Plug 'jremmen/vim-ripgrep'
Plug 'gruvbox-community/gruvbox'
Plug 'sheerun/vim-polyglot'
Plug 'airblade/vim-rooter'
Plug 'editorconfig/editorconfig-vim'
Plug 'honza/vim-snippets'
Plug 'Yggdroot/indentLine'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'godlygeek/tabular'
Plug 'vimwiki/vimwiki', {'branch': 'dev'}
Plug 'AndrewRadev/quickpeek.vim'
Plug 'n0v1c3/vira', { 'do': './install.sh', 'branch': 'dev' }
Plug 'puremourning/vimspector'
Plug 'Raimondi/delimitMate'
call plug#end()
packadd! matchit
" needed to get cursor block in mingw64 let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"

let &t_Cs = "\e[4:3m"
let &t_Ce = "\e[4:0m"
filetype indent plugin on
set nocompatible
set hidden " keep abandoned buffers open
set noswapfile
syntax on
set signcolumn=yes " always show sign column so it doesn't shifting the text
set ignorecase
set backspace=indent,eol,start
set path+=**
set wildmenu
" set wildoptions=pum
set wildignore+=*/node_modules/*
set wildignore+=batect
set wildignore+=batect.cmd
set wildignore+=_site,*/__pycache__/,*/venv/*,*/target/*,*/.vim$,\~$,*/.log,*/.aux,*/.cls,*/.aux,*/.bbl,*/.blg,*/.fls,*/.fdb*/,*/.toc,*/.out,*/.glo,*/.log,*/.ist,*/.fdb_latexmk
set wildignore+=*/bin/*,*/obj/*
set ruler
set expandtab
set sts=2
set shiftwidth=2
set clipboard=unnamed
set encoding=utf8
set incsearch
" allow <C-A> and <C-X> to increment letters
set nrformats+=alpha
set cursorline " highlight the current line
" navigate vim windows
set winminheight=0
set number relativenumber
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
vnoremap <A-j> :move '>+1<CR>gv=gv
inoremap <A-k> <Esc>:move .-2<CR>==gi
nnoremap <A-j> :move .+1<CR>==
nnoremap <A-k> :move .-2<CR>==
inoremap <A-j> <Esc>:move .+1<CR>==gi
vnoremap <A-k> :move '<-2<CR>gv=gv

" open vimrc
nnoremap <Leader>ev :e ~/dotfiles/.vimrc<CR>

" close both files for a diff
nnoremap <silent> <leader>q :quitall<CR>

source $HOME/.vim/plugin-config/coc.vim
source $HOME/.vim/plugin-config/vira.vim
source $HOME/.vim/plugin-config/vimwiki.vim
source $HOME/.vim/plugin-config/airline.vim
source $HOME/.vim/plugin-config/gruvbox.vim
source $HOME/.vim/plugin-config/fugitive.vim
source $HOME/.vim/plugin-config/fold.vim
source $HOME/.vim/plugin-config/clipboard.vim
source $HOME/.vim/plugin-config/ctrlp.vim
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
let g:ale_c_parse_makefile = 1

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


" dracula {{{1
let g:dracula_italic = 0
augroup dracula_customisation
  autocmd!
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

autocmd WinEnter * if &buftype == 'quickfix' | wincmd J | execute "resize" . ((&lines - len(winlayout()[1])) / 2) | elseif &filetype != 'VimspectorPrompt'| wincmd _ | else | wincmd = | endif


let g:quickpeek_auto = v:true
let g:quickpeek_popup_options = {
      \ 'line': 1
      \ }
" let g:quickpeek_popup_options = {'pos': 'topleft'}

set background=dark

" rooter {{{1
" add extra root markers to support mono repos..
" Many apps exit in the same mono repo and you don't want to keep changing to
" the root
let g:rooter_patterns = ['requirements.txt', 'Pipfile', '.git', 'Makefile']
let g:ctrlp_root_markers = ['requirements.txt', 'Pipfile']


" make alt hotkeys work in certain terminals
" https://stackoverflow.com/questions/6778961/alt-key-shortcuts-not-working-on-gnome-terminal-with-vim
if has('unix') && !has('nvim')
  let c='a'
  while c <= 'z'
    exec "set <A-".c.">=\e".c
    exec "imap \e".c." <A-".c.">"
    let c = nr2char(1+char2nr(c))
  endw
  set timeout ttimeoutlen=50
endif

let g:vimspector_enable_mappings = 'HUMAN'
let g:vimspector_install_gadgets = [ 'debugpy' ]


" functions to scroll through documentation
" press K to show documentation. Works when you using popup for coc
set belloff+=esc
nnoremap <expr> <c-d> <SID>scroll_cursor_popup(1) ? '<esc>' : '<c-d>'
nnoremap <expr> <c-u> <SID>scroll_cursor_popup(0) ? '<esc>' : '<c-u>'

function s:find_cursor_popup(...)
  let radius = get(a:000, 0, 2)
  let srow = screenrow()
  let scol = screencol()

  " it's necessary to test entire rect, as some popup might be quite small
  for r in range(srow - radius, srow + radius)
    for c in range(scol - radius, scol + radius)
      let winid = popup_locate(r, c)
      if winid != 0
        return winid
      endif
    endfor
  endfor

  return 0
endfunction

function s:scroll_cursor_popup(down)
  let winid = s:find_cursor_popup()
  if winid == 0
    return 0
  endif

  let pp = popup_getpos(winid)
  call popup_setoptions(winid, {'firstline' : pp.firstline + (a:down ? 5 : -5) })
  return 1
endfunction
