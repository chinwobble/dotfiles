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


### Set up conda env on ubuntu
```sh
source ~/miniconda3/etc/profile.d/conda.sh

conda create --name myrepo python=3.7
conda activate myrepo
pip install databricks-cli
conda env config vars set DATABRICKS_HOST=https://australiaeast.azuredatabricks.net
conda env config vars set DATABRICKS_TOKEN=xxxxxx
```

### Setup linux with standard tools
```bash
sudo apt install jq ripgrep make unzip zip
```

### Setup Linux c++ tools
```bash
sudo apt install socat cmake g++ gdb 
```
