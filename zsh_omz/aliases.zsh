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
## Programs
### Git
alias gs='git status'
alias gc='git commit -a -m'

### Chatblade
alias -g cb='chatblade'

### fasd
# dirs
alias jd='fasd -d'
# files
alias jf='fasd -f'
# files and dirs
alias ja='fasd -a'
# dirs with scores, interactive
alias jjd='fasd -sid'
# files with scores, interactive
alias jjf='fasd -sif'
# paths with scores, interactive mode
alias jja='fasd -si'
# function to execute built-in cd
fasd_cd() {
  if [ $# -le 1 ]; then
    fasd "$@"
  else
    local _fasd_ret="$(fasd -e 'printf %s' "$@")"
    [ -z "$_fasd_ret" ] && return
    [ -d "$_fasd_ret" ] && cd "$_fasd_ret" || printf %s\n "$_fasd_ret"
  fi
}
alias j='fasd_cd -d'
alias jj='fasd_cd -d -i'

alias jc='fasd -a -e code'
alias jjc='fasd -sia -e code'

## Dir and file shortcuts
alias cdst='cd ~/Code/stock_price_prediction/'
alias zshrc="code /Users/danthompson/Code/dotfiles/zsh_omz"
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
alias -g e="exa -a"
alias -g cat="bat -p"
alias -g b="bat"