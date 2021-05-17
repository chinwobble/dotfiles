if exists('g:loaded_databricks')
  finish
endif

let g:loaded_databricks = 1

" import current file
function! s:ImportDatabricksNotebook()
    silent !clear
    let projectroot = FindRootDirectory()
    if projectroot == ''
      return
    endif
    let filefullname = substitute(expand('%:p:h'), '\\', '/', 'g')
    let projectname = fnamemodify(projectroot, ':t')
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

    if has('win32')
      execute "term ++shell "
            \. "call C:\\tools\\miniconda3\\condabin\\conda_hook.bat "
            \. "&& conda activate " . projectname . " "
            \. "&& databricks workspace mkdirs " . databricksfullpath . " "
            \. "&& databricks workspace import "
            \. "-o "
            \. "-l " . lang . " "
            \. expand('%:p') . " "
            \. databricksfullpath . expand('%:t:r')
    endif
    if has('unix')
      execute "term ++shell "
            \. "source ~/miniconda3/etc/profile.d/conda.sh"
            \. "&& conda activate " . projectname . " "
            \. "&& databricks workspace mkdirs " . databricksfullpath . " "
            \. "&& databricks workspace import "
            \. "-o "
            \. "-l " . lang . " "
            \. expand('%:p') . " "
            \. databricksfullpath . expand('%:t:r')
    endif
  endfunction

function! s:ExportDatabricksNotebook()
    silent !clear
    let projectroot = FindRootDirectory()
    if projectroot == ''
      return
    endif
    let filefullname = substitute(expand('%:p:r'), '\\', '/', 'g')
    let projectname = fnamemodify(projectroot, ':t')
    let projectroot = substitute(projectroot, '\\', '/', 'g')
    let databrickspath = substitute(filefullname, projectroot, '', 'g')

    if has('unix')
      execute "term ++shell "
            \. "source ~/miniconda3/etc/profile.d/conda.sh "
            \. "&& conda activate " . projectname . " "
            \. "&& databricks workspace export "
            \. " -o"
            \.  " /Users/benney.au@prospa.com/" . FugitiveHead()
            \. fnamemodify(databrickspath, ":r")->substitute("/notebooks", "", "")
            \. " "
            \. expand('%:p')
    endif

    if has('win32')
      execute "term ++shell "
            \. "call C:\\tools\\miniconda3\\condabin\\conda_hook.bat "
            \. "&& conda activate " . projectname . " "
            \. "&& databricks workspace export "
            \. " -o"
            \.  " /Users/benney.au@prospa.com/" . FugitiveHead()
            \. fnamemodify(databrickspath, ":r")->substitute("/notebooks", "", "")
            \. " "
            \. expand('%:p')
    endif
endfunction

command! DatabricksImportNotebook call s:ImportDatabricksNotebook()
command! DatabricksExportNotebook call s:ExportDatabricksNotebook()

nmap <leader>de :DatabricksExportNotebook<cr>
nmap <leader>di :DatabricksImportNotebook<cr>
