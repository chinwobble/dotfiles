vim.opt["winminheight"] = 0

vim.cmd [[
  autocmd WinEnter * if &buftype == 'quickfix' | wincmd J | execute "resize" . ((&lines - len(winlayout()[1])) / 2) | elseif &filetype != 'VimspectorPrompt'| wincmd _ | else | wincmd = | endif
]]
