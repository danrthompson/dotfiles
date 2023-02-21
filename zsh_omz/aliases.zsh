## Aliases
# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


# aliases can be
# simple: alias ginit="git init ."
# suffix: alias -s txt=neovim
# global: alias -g gp="grep" | used for piping to the command
# parameterized: search_man() {
    # man $1 | grep -- $2
# }


# prevent certain corrections
alias install='nocorrect install'

# aliases
## Git
alias gs='git status'
alias gc='git commit -a -m'

## Dir and file shortcuts
alias cdst='cd ~/Code/stock_price_prediction/'
alias zshrc="code ~/.zshrc"
alias jn='jupyter-notebook ~/Code/Notebooks'

## Command aliases
alias lsr='ls -lARFh'
alias h='history'
alias p='ps -f'
alias H='\| head'
alias ipy='ipython'
alias or="omz reload"

## Environment management
alias pybook='cd /Users/danthompson/Code/Courses/pydata-book; mamba activate pydata-book'


# global aliases
## Main program override
alias -g cat="bat -p"