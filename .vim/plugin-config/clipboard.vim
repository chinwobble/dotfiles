" WSL yank support
let s:clip = "/mnt/c/Windows/System32/clip.exe"
if executable(s:clip)
  noremap "+p :exe 'norm a'.system('/mnt/c/Windows/System32/WindowsPowerShell/v1.0/powershell.exe -Command Get-Clipboard')<CR>
  augroup wslyank
    autocmd!
    autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
  augroup end
endif
