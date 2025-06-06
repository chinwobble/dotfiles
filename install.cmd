pushd %userprofile%

del .bashrc
mklink .bashrc dotfiles\.bashrc.win

del .inputrc
mklink .inputrc dotfiles\.inputrc
del .vimrc
mklink .vimrc dotfiles\.vimrc
del .minttyrc
mklink .minttyrc dotfiles\.minttyrc
del .gitconfig
mklink .gitconfig dotfiles\.gitconfig

mklink %cd%\vimfiles %cd%\dotfiles\.vim /D

del %appdata%\Code\User\settings.json
mklink %appdata%\Code\User\settings.json %CD%\dotfiles\Code\User\settings.json
del %appdata%\Code\User\.vscodestyles.css
mklink %appdata%\Code\User\.vscodestyles.css %CD%\dotfiles\Code\User\.vscodestyles.css
del %appdata%\Code\User\keybindings.json
mklink %appdata%\Code\User\keybindings.json %CD%\dotfiles\Code\User\keybindings.json
rd /Q /S %appdata%\Code\User\snippets\
mklink /D %appdata%\Code\User\snippets %CD%\dotfiles\Code\User\snippets

mklink %localappdata%\packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\localState\settings.json %userprofile%\dotfiles\settings.json
popd
