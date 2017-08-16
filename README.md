# What's this ?
My .vim folder with every plugin and my own annotated .vimrc file

# Requirements

- nodejs (Optional, for YCM javascript tern support)
- vim-gtk/vim-gnome (Optional, for system clipboard sync support)

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

- Compile vimproc (go to [the Vimproc repo](https://github.com/Shougo/vimproc.vim) and follow the "Manual" installation steps)

- For Typescript, install typescript and tslint globally (`npm install -g typescript tslint`) so that Syntastic can use them

- For Prettier automatic formatting, install prettier globally (`npm install -g prettier`)

- Don't forget to review the .vimrc file ! I took some time to comment why I added stuff here and there's a lot of little things so feel free to own the file. That's what Vim is about after all: owning your IDE :)

- Remember that `:help` is your friend. If you don't understand a setting, or a command, just `:help` it !

- Enjoy !

# Credits

All the vim community that helped a late vimer like me to take one the most
powerful albeit challenging text editor.

Special mentions:

- http://learnvimscriptthehardway.stevelosh.com/
