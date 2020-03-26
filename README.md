# What's this ?
My .vim folder with every plugin I use and my own annotated .vimrc file

# Requirements

- GNU make
- nodejs (Optional but highly recommended, for YCM javascript support, typescript, and prettier)
- vim-gtk or vim-gnome (Optional, for system clipboard sync support)

# Installation

- Clone this repo anywhere (I use it as a submodule in my [init-environment repo](https://github.com/stephanetrebel/init-environment), for instance.
- Use GNU make:

```bash
$ make install
```

- For Typescript, install typescript and tslint globally (`npm install -g typescript tslint`) so that Syntastic can use them
- For Prettier automatic formatting, install prettier globally (`npm install -g prettier`)
- Don't forget to review the .vimrc file ! I took some time to comment why I added stuff here and there's a lot of little things so feel free to own the file. That's what Vim is about after all: owning your IDE :)
- Remember that `:help` is your friend. If you don't understand a setting, or a command, just `:help` it !

Enjoy !

# Credits

All the vim community that helped a late vimer like me take over one of the most
powerful — albeit challenging — text editor.

Special mentions:

- http://learnvimscriptthehardway.stevelosh.com/
- [Using GNU Stow to manage your dotfiles](http://brandon.invergo.net/news/2012-05-26-using-gnu-stow-to-manage-your-dotfiles.html)
