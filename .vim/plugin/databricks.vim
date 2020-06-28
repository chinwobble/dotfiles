if exists('g:loaded_databricks')
  finish
endif

let g:loaded_databricks = 1

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


function! s:GetProjectRoot(...)
  " let fullfile = s:getfullname(a:0 ? a:1 : '')
  let fullfile = expand('%:p:h')

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

" import current file
function! s:ImportDatabricksNotebook()
    silent !clear
    let projectroot = s:GetProjectRoot()
    if projectroot == ''
      return
    endif
    let filefullname = substitute(expand('%:p:h'), '\\', '/', 'g')
    let projectroot = substitute(projectroot, '\\', '/', 'g')
    let databrickspathpart = substitute(filefullname, projectroot, '', 'g') . "/"
    let databricksfullpath = "/Users/benney.au@prospa.com/"
          \. FugitiveHead()
          \. databrickspathpart->substitute("/notebooks", "", "")
    let extension = expand('%:e')

    if extension == 'py'
      let lang = 'python'
    endif
    if extension == 'sql'
      let lang = 'sql'
    endif

    execute "term ++shell "
        \. "call C:\\tools\\miniconda3\\condabin\\conda_hook.bat "
        \. "&& conda activate risbricks "
        \. "&& databricks workspace mkdirs --profile risbricks " . databricksfullpath . " "
        \. "&& databricks workspace import --profile risbricks "
        \. "-o "
        \. "-l " . lang . " "
        \. expand('%:p') . " "
        \. databricksfullpath . expand('%:t:r')
endfunction

function! s:ExportDatabricksNotebook()
    silent !clear
    let projectroot = s:GetProjectRoot()
    if projectroot == ''
      return
    endif
    let filefullname = substitute(expand('%:p:r'), '\\', '/', 'g')
    let projectroot = substitute(projectroot, '\\', '/', 'g')
    let databrickspath = substitute(filefullname, projectroot, '', 'g')

    call job_start("cmd /c "
        \. "call C:\\tools\\miniconda3\\condabin\\conda_hook.bat "
        \. "&& conda activate risbricks "
	\. "&& databricks workspace export --profile risbricks "
	\. " -o"
        \.  " /Users/benney.au@prospa.com/" . FugitiveHead()
	\. fnamemodify(databrickspath, ":r")->substitute("/notebooks", "", "")
	\. " "
	\. expand('%:p'),
        \{'err_cb': 'ErrorHandler'
        \, 'out_cb': 'StdHandler'})
endfunction

command! DatabricksImportNotebook call s:ImportDatabricksNotebook()
command! DatabricksExportNotebook call s:ExportDatabricksNotebook()

nmap <leader>de :DatabricksExportNotebook<cr>
nmap <leader>di :DatabricksImportNotebook<cr>

function! s:ErrorHandler(channel, message)
  " echo a:message
  return
  if a:message !~ "^Error"
    " call append(line('.'), 'not error')
    " call append(line('.'), 'from errorhandler: ' . a:message)
    return
  endif
"   call append(line('.'), 'from errorhandler: ' . a:message)
  " echo a:message
endfunction

function! StdHandler(channel, message)
  if a:message =~ "^Error"
"     call append(line('.'), 'from stdhandler: ' . a:message)
    echohl ErrorMsg | echom a:message | echohl None
  else
    " call append(line('.'), 'not error from stdhandler: ' . a:message)
  endif
endfunction
