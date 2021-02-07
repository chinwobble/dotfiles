# Dotfiles

## Installation
### Windows
```bash
# in git bash
cd ~
git clone git@github.com:chinwobble/dotfiles
cd dotfiles
./windows.install.sh
```
## Install VS2019 code snippets
```cmd
" command prompt or powershell
git clone git@github.com:chinwobble/dotfiles

" delete empty folder
rd /S /Q "%userprofile%\documents\Visual Studio 2019\Code Snippets"

" symlink repository to VS studio documents folder
mklink /D "%userprofile%\Documents\Visual Studio 2019\Code Snippets" "%CD%\dotfiles\documents\Visual Studio 2019\Code Snippets"
```

inside vim run the following command
```bash
:PlugUpgrade
```

### export linux packages on debian
```sh
dpkg --get-selections | grep -v deinstall | awk '{print S1}' > package.lst
```

### import linux packages
```sh
sudo apt install package.lst
```
