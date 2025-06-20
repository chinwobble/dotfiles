let g:vimwiki_auto_header = 1
let g:vimwiki_key_mappings =
    \ {
    \ 'headers': 0,
    \ 'table_mappings': 0,
    \ }
let g:vimwiki_folding = 'syntax'

let g:vimwiki_hl_cb_checked = 2
let g:vimwiki_list = [
  \ { 'auto_toc': 1,
  \ 'auto_tags': 1,
  \ 'auto_diary_index': 1,
  \ 'auto_generate_tags': 1,
  \ 'path': '~/vimwiki/',
  \ 'syntax': 'markdown',
  \ 'links_space_char': '_',
  \ 'ext': '.md' },
  \ { 'auto_toc': 1,
  \ 'auto_tags': 1,
  \ 'auto_diary_index': 1,
  \ 'path': '~/wiki',
  \ 'index': 'README',
  \ 'syntax': 'markdown',
  \ 'ext': '.md' }
  \ ]

function! s:InsideWSL()
  let uname = substitute(system('uname'),'\n','','')
  if uname == 'Linux'
    if system('$PATH')=~ '/mnt/c/'
      " We are in Windows Subsystem
      return 1
    endif
  endif
  return 0
endfunction

function! VimwikiLinkHandler(link)
  " if link doesn't start with https:
  " return 0, meaning we want to use the default link handler
  if a:link !~# '^https:'
    return 0
  endif
  try
    if has('unix') && s:InsideWSL()
      let browser = '/mnt/c/Program Files/Mozilla Firefox/firefox.exe'
      execute '! "'.browser.'" ' . a:link
      return 1
    endif
    let browser = 'C:\Program Files\Firefox\firefox.exe'
    execute '!start "'.browser.'" ' . a:link
    return 1
  catch
    echo "This can happen for a variety of reasons ..."
  endtry
  return 0
endfunction
