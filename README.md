## Note: 
Super out of date, have been pushing all my dotfiles including my .vimrc into one private repo. Planning to make a private dotfile repo with a public submodule so I can separate sensitive password information from general dotfiles, and so I can start publishing them again!

# vimrc
My .vimrc file, with plugin manager included

## Plug.vim
Trying out [this new](https://github.com/junegunn/vim-plug "Plug.vim") package manager. Coming over from [Pathogen](https://github.com/tpope/vim-pathogen "Pathogen.vim"). Supposed to be able to version control all your plugins with just your .vimrc file, and keep them updated too. Works well so far.

## Plugin Installation with Plug.vim
Once the .vimrc is put in home directory (or any other suitable place), open up vim, and execute the command:
```vim
:PlugInstall
```
