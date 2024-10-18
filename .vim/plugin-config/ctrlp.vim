let g:ctrlp_extensions = ['tag', 'buffertag', 'quickfix',
                          \ 'undo', 'line', 'changes', 'mixed', 'bookmarkdir']

" exclude dotnet build artifacts
let g:ctrlp_custom_ignore = 'bin\|obj\|git\|DS_Store\|node_modules\|_build\|esy.lock\|_esy'
