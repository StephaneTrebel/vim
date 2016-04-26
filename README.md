# What's this ?
My .vim folder with every plugin and my own annotated .vimrc file

# Installation
- Clone this repo in your Home folder
- Do `git submodule init` and then `git submodule update` to automatically install Vundle
- Launch `vim`, pass the error message with `Enter` and execute `:PluginInstall`. There will be an error beginning with "ycm_core". Just skip it with `Enter`
- When finished, exit and compile [YouCompleteMe](https://github.com/Valloric/YouCompleteMe#ubuntu-linux-x64) (*Warning*: CMake and Python dependencies)
- Add a *.vimrc* file in your home folder linking to my .vimrc file: `echo source ~/.vim/.vimrc > ~/.vimrc`
- Enjoy !
