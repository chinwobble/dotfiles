if !exists('g:rootmarkers')
  let g:rootmarkers =
        \ ['.projectroot'
        \, '.git'
        \, '.hg'
        \, '.svn'
        \, '.bzr'
        \, '_darcs'
        \, 'build.xml']
endif

augroup CtrlPDirMRU
  autocmd!
  autocmd FileType *
        \if &modifiable && !empty(g:GetProjectRoot(expand('%:p')))
        \| let projectRoot = GetProjectRoot(expand('%:p'))
        \| echom projectRoot
        \| execute 'silent CtrlPBookmarkDirAdd! ' . projectRoot
        \| else
          \| echom GetProjectRoot(expand('%:p'))
        \| endif
augroup END

function! g:GetProjectRoot(folder)
  " let fullfile = s:getfullname(a:0 ? a:1 : '')
  let fullfile = a:folder

  if fullfile =~ '^fugitive:/'
    if exists('b:git_dir')
      return fnamemodify(b:git_dir, ':h')
    endif
    return '' " skip any fugitive buffers early
  endif
  for marker in g:rootmarkers
    let pivot = fullfile
    while 1
      let prev = pivot
      let pivot = fnamemodify(pivot, ':h')
      let fn = pivot . (pivot == '/' ? '' : '/') . marker
      if filereadable(fn) || isdirectory(fn)
        return pivot
      endif
      if pivot == prev
        break
      endif
    endwhile
  endfor
  return ''
endfunction
