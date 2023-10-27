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
alias gom='git checkout main'

### Pyenv
alias pd='pyenv deactivate'

### Chatblade
alias -g cb='chatblade'

### fasd - recent (or just past) directory and file navigation, in iTerm and VSCode or Finder
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

## Opening directories in iTerm. Provide a search string and it will find the best matching directories and open the best (or chosen) one in iTerm
# Open the best matching dir
alias j='fasd_cd -d'
# Interactively choose among the best matching directories to open in iTerm
alias jj='fasd_cd -d -i'

## Opening directories in VSCode
# Open best match
alias jc='fasd -d -e code'
# Interactively select among best matches
alias jjc='fasd -sid -e code'

## Opening files in VSCode
# Open best match
alias jcf='fasd -f -e code'
# Interactively select among best matches
alias jjcf='fasd -sif -e code'

## Opening directories in Finder
# Open best match
alias jo='fasd -d -e open'
# Interactively select among best matches
alias jjo='fasd -sid -e open'

## Opening files in Finder
# Open best match
alias jof='fasd -f -e open'
# Interactively select among best matches
alias jjof='fasd -sif -e open'

# Show all matching dirs with scores (optionally provide a search string)
alias jds='fasd -d'
# Ditto for files
alias jfs='fasd -f'
# Ditto for files and dirs
alias jas='fasd -a'
# Dirs and scores with interactive selection - not sure what this is for actually. Disabling until I figure that out. Maybe could be used to open the file in another app like Finder or VSCode?
# alias jjd='fasd -sid'
# # files with scores, interactive
# alias jjf='fasd -sif'
# # paths with scores, interactive mode
# alias jja='fasd -si'

## Dir and file shortcuts
# Work dirs
# Dictation app
alias oww='cd /Users/danthompson/Code/Git/XCode/WhisperDictationApp'
alias cww='code /Users/danthompson/Code/Git/XCode/WhisperDictationApp'
# OnlyFans app
alias oof='cd /Users/danthompson/Code/Git/my_repos/OnlyFans'
alias cof='code /Users/danthompson/Code/Git/my_repos/OnlyFans'

# Useful common dirs
# alias cdst='cd ~/Code/stock_price_prediction/'
alias zz="code /Users/danthompson/Code/dotfiles"
alias pynb='jupyter-notebook ~/Code/Notebooks'


## Command aliases
alias lsr='ls -lARFh'
alias h='history'
alias p='ps -f'
alias ipy='ipython'
alias or="omz reload"

## Pipe commands
alias -g qh='| head '
alias -g qt='| tail '
alias -g qtf='| tail -f '
alias -g ql='| wc -l '
alias -g qg='| grep '
alias -g pa='pyenv activate '

## Environment management
alias pybook='cd /Users/danthompson/Code/Courses/pydata-book; mamba activate pydata-book'
# activate data_science_env managed by conda/mamba
alias ads='mamba activate data_science_env'

# global aliases
## Main program override
alias -g e="exa -a"
alias -g cat="bat -p"
alias -g b="bat"
alias -g ggs="sgpt"
alias cc="it2copy"

alias ww="~/Code/Tools/cloned/whisper-writer/src/start_background_process.zsh"

alias wk="~/Code/Tools/cloned/whisper-writer/src/kill_background_process.zsh"
alias wl="tail -f ~/Code/Tools/cloned/whisper-writer/nohup.out"

alias wr='if [ -n "$(ps aux | grep "src/km_handler" | grep -v grep)" ]; then echo "Process is running"; else echo "Process is not running"; fi'

alias wf="osascript -e 'tell application \"Keyboard Maestro Engine\" to setvariable \"WhisperRunning\" to \"no\"'"

function ggr() {
  cd /Users/danthompson/Code/Tools/cloned/gpt-researcher
  uvicorn main:app --reload
}