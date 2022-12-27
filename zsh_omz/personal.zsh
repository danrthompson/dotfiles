# If you come from bash you might have to change your $PATH.
export PATH=$HOME/.local/bin:$PATH

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM=/path/to/new-custom-folder

## personal configs
export MCFLY_FUZZY=2


# import other zshrc config files
if [ -f /Users/danthompson/Dropbox/dotfiles/zshomz/.zsh_aliases ]; then
    source /Users/danthompson/Dropbox/dotfiles/zshomz/.zsh_aliases
else
    print "404: ~/Dropbox/dotfiles/zshomz/.zsh_aliases not found."
fi

if [ -f /Users/danthompson/Dropbox/dotfiles/zshomz/.zsh_packages ]; then
    source /Users/danthompson/Dropbox/dotfiles/zshomz/.zsh_packages
else
    print "404: ~/Dropbox/dotfiles/zshomz/.zsh_packages not found."
fi

if [ -f /Users/danthompson/Dropbox/dotfiles/zshomz/.zsh_personal ]; then
    source /Users/danthompson/Dropbox/dotfiles/zshomz/.zsh_personal
else
    print "404: ~/Dropbox/dotfiles/zshomz/.zsh_personal not found."
fi

