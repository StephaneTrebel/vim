# What's this ?
My .vim folder with every plugin I use and my own annotated .vimrc file

# Requirements

- GNU stow, to handily install dotfiles in your home folder
- nodejs (Optional but highly recommended, for YCM javascript tern support, typescript, tslint, and prettier)
- vim-gtk/vim-gnome (Optional, for system clipboard sync support)

# Installation
- Create a dotfiles or .dotfiles directory if you haven't already
- Clone this repo in your dotfiles directory
- Use GNU stow to make all required symlink:

```bash
# stow vim
```

- Install Vundle:

```javascript
cd <DOTFILES_DIRECTORY>/vim && git submodule init && git submodule update
```

- Launch `vim`, pass the error messages with `Enter` and type `:PluginInstall` and `Enter`.
- When finished, exit and compile [YouCompleteMe](https://github.com/Valloric/YouCompleteMe):

```bash
# Warning: this will only give you javascript support, for other options go to the YouCompleteMe repo for explanations

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
- GNU stow
- http://brandon.invergo.net/news/2012-05-26-using-gnu-stow-to-manage-your-dotfiles.html
