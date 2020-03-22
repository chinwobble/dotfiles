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

## Installing new vim plugins
```bash
git submodule add xxxxx module
```

## Update vim plugins
```bash
git submodule update --remote --merge
```
