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
