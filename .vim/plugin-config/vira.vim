augroup vira_customizations
  autocmd!
  autocmd WinEnter,BufEnter vira_report silent! wincmd J | wincmd _
augroup END

nnoremap <silent> <leader>ve :ViraEpics<cr>
nnoremap <silent> <leader>vi :ViraIssues<cr>
nnoremap <silent> <leader>vr :ViraReport<cr>


" Functions
function! Enter_ViraActiveIssue()
  let g:vira_active_issue = input("Enter issue.key: ")
  ViraReport
endfunction
nnoremap <silent> <leader>vei :call Enter_ViraActiveIssue()<cr>
