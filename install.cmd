pushd %userprofile%

del .bashrc
mklink .bashrc dotfiles\.bashrc.win

del .inputrc
mklink .inputrc dotfiles\.inputrc
del .gvimrc
mklink .gvimrc dotfiles\.gvimrc
del .vimrc
mklink .vimrc dotfiles\.vimrc

popd