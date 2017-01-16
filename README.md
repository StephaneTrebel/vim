# What's this ?
My .vim folder with every plugin and my own annotated .vimrc file

# Requirements

- nodejs (for YCM javascript tern support)

# Installation
- Clone this repo in your Home folder
- Add a *.vimrc* file in your home folder linking to my .vimrc file: `echo source ~/.vim/.vimrc > ~/.vimrc`
- Install Vundle:

```javascript
cd .vim && git submodule init && git submodule update
```

- Launch `vim`, pass the error message with `Enter` and type `:PluginInstall`. At launch, there will be an error about "ycm_core". Just skip it with `Enter`
- When finished, exit and compile [YouCompleteMe](https://github.com/Valloric/YouCompleteMe):

```bash
# Warning: this will only install javascript support, for other options go to the YouCompleteMe repo for explanations

# Install C dependencies
sudo apt-get install build-essential cmake

# Install Python dependencies
sudo apt-get install python-dev python3-dev

cd ~/.vim/bundle/YouCompleteMe

# Install with javascript support
./install.py --tern-completer
```

- Enjoy !
