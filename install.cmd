pushd %userprofile%

del .bashrc
mklink .bashrc dotfiles\.bashrc.win

del .inputrc
mklink .inputrc dotfiles\.inputrc
del .gvimrc
mklink .gvimrc dotfiles\.gvimrc
del .vimrc
mklink .vimrc dotfiles\.vimrc

del %appdata%\Code\User\settings.json
mklink %appdata%\Code\User\settings.json %CD%\dotfiles\Code\User\settings.json
del %appdata%\Code\User\.vscodestyles.css
mklink %appdata%\Code\User\.vscodestyles.css %CD%\dotfiles\Code\User\.vscodestyles.css
del %appdata%\Code\User\keybindings.json
mklink %appdata%\Code\User\keybindings.json %CD%\dotfiles\Code\User\keybindings.json
rd /Q /S %appdata%\Code\User\snippets\
mklink /D %appdata%\Code\User\snippets %CD%\dotfiles\Code\User\snippets

popd
