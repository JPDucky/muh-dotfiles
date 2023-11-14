# My Dotfiles!
## Why?
The purpose of this repository is to keep all of my dotfiles collected into one place, feel free to use them as you wish.
## Usage:
Clone this repo into a directory of your choosing, be it ~/dotfiles or ~/jpducky/muh-dotfiles, then copy the files to wherever you want (or keep them wherever you put them).
It doesn't really matter where you put them as `stow` will put them in the right place so long as you use the `--target=` flag.

The reason I'm not going to make a script to move everything into place automatically is that these locations can differ from machine to machine, and is relatively distro-agnostic. I don't really like scripts that move everything all at once automatically, that's just a recipe for a headache.

To get all of these files into their respective locations, use `stow <PACKAGE_NAME> --target=$HOME/<LOCATION>`

Take the example of nvim, which belongs in the ~/.config/ directory: `stow nvim --target=$HOME/.config/nvim`

Stow should create the proper symlinks to the indicated target directory, allowing you to manage all of your dotfiles from within one directory.

I would recommend putting your wallpapers into ~/wallpaper for the background stuff to work properly 

## Notes:
I've had collected various scripts around the web from people whose dotfiles I like.

I make no promises to keep this repo up to date or not to abandon it entirely. This is just to make my stuff look pretty. That said, stuffs pretty pretty ;)
