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
