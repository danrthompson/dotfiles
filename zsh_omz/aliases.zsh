## Aliases
# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

## prevent certain corrections
alias install='nocorrect install'

## aliases

alias gs='git status'
alias gom="git checkout $(git_main_branch)"
alias god="git checkout $(git_develop_branch)"
alias gcm='git commit -m'

alias cdst='cd ~/Code/stock_price_prediction/'

alias lsr='ls -lARFh'

alias zshrc="code ~/.zshrc"
alias h='history'
alias p='ps -f'
alias H='\| head'
alias jn='jupyter-notebook ~/Code/Notebooks'
