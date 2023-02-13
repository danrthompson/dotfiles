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


## prevent certain corrections
alias install='nocorrect install'

## aliases

alias gs='git status'
alias gom='git checkout $(git_main_branch)'
alias god='git checkout $(git_develop_branch)'
alias gcm='git commit -m'

alias cdst='cd ~/Code/stock_price_prediction/'

alias lsr='ls -lARFh'

alias zshrc="code ~/.zshrc"
alias h='history'
alias p='ps -f'
alias H='\| head'
alias jn='jupyter-notebook ~/Code/Notebooks'

alias pybook='cd /Users/danthompson/Code/Courses/pydata-book; mamba activate pydata-book'

alias ipy='ipython'

alias or="omz reload"

# global aliases
alias -g cat="bat -p"