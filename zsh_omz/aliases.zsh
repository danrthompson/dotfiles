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


alias -g u="cursor"

alias stopjackett="launchctl unload ~/Library/LaunchAgents/Disabled/org.user.Jackett.plist"
alias startjackett="launchctl load ~/Library/LaunchAgents/Disabled/org.user.Jackett.plist"

# prevent certain corrections
alias install='nocorrect install'

# aliases
## Programs
### Firebase emulator
alias emb="export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES"
alias ema="unset OBJC_DISABLE_INITIALIZE_FORK_SAFETY"
### Git
alias -g gap="git add -p -- "
alias -g go="git checkout "
alias -g gob="git checkout -b "
alias -g gb="git branch "
alias -g np="git checkout HEAD -- Speakeasy.xcodeproj/project.xcworkspace/xcshareddata/swiftpm/Package.resolved && "

alias stashnp="git add . && git reset Speakeasy.xcodeproj/project.xcworkspace/xcshareddata/swiftpm/Package.resolved && git stash push -S"

alias addnp="git add . && git reset Speakeasy.xcodeproj/project.xcworkspace/xcshareddata/swiftpm/Package.resolved"

alias gs='git status'
alias -g gc="git commit -m "
alias -g gca="git commit --verbose --all -m "
alias gom='git checkout main'
alias grl='git reset HEAD^1'

### Pyenv
# alias pd='pyenv deactivate'

### Chatblade
alias -g cb='chatblade'

# zoxide
# Use zoxide with fzf for interactive directory selection
zi() {
  local dir
  dir=$(zoxide query --list | fzf --height 40% --reverse) && cd "$dir"
}

alias j="z"
alias jj="zi"

### removed
# ### fasd - recent (or just past) directory and file navigation, in iTerm and VSCode or Finder
# # function to execute built-in cd
# fasd_cd() {
#   if [ $# -le 1 ]; then
#     fasd "$@"
#   else
#     local _fasd_ret="$(fasd -e 'printf %s' "$@")"
#     [ -z "$_fasd_ret" ] && return
#     [ -d "$_fasd_ret" ] && cd "$_fasd_ret" || printf %s\n "$_fasd_ret"
#   fi
# }

# ## Opening directories in iTerm. Provide a search string and it will find the best matching directories and open the best (or chosen) one in iTerm
# # Open the best matching dir
# alias j='fasd_cd -d'
# # Interactively choose among the best matching directories to open in iTerm
# alias jj='fasd_cd -d -i'

# ## Opening directories in VSCode
# # Open best match
# alias jc='fasd -d -e cursor'
# # Interactively select among best matches
# alias jjc='fasd -sid -e cursor'

# ## Opening files in VSCode
# # Open best match
# alias jcf='fasd -f -e cursor'
# # Interactively select among best matches
# alias jjcf='fasd -sif -e cursor'

# ## Opening directories in Finder
# # Open best match
# alias jo='fasd -d -e open'
# # Interactively select among best matches
# alias jjo='fasd -sid -e open'

# ## Opening files in Finder
# # Open best match
# alias jof='fasd -f -e open'
# # Interactively select among best matches
# alias jjof='fasd -sif -e open'

# # Show all matching dirs with scores (optionally provide a search string)
# alias jds='fasd -d'
# # Ditto for files
# alias jfs='fasd -f'
# # Ditto for files and dirs
# alias jas='fasd -a'
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
alias cww='cursor /Users/danthompson/Code/Git/XCode/WhisperDictationApp'
# OnlyFans app
alias oof='cd /Users/danthompson/Code/Git/my_repos/OnlyFans'
alias cof='cursor /Users/danthompson/Code/Git/my_repos/OnlyFans'

# Useful common dirs
# alias cdst='cd ~/Code/stock_price_prediction/'
alias zz="cursor /Users/danthompson/Code/dotfiles"
alias pynb='jupyter-notebook ~/Code/Notebooks'

## Command aliases
alias lsr='ls -lARFh'
alias h='history'
alias p='ps -f'
alias ipy='ipython'
alias or="omz reload"

## Pipe commands
alias -g ph='| head '
alias -g pt='| tail '
alias -g ptf='| tail -f '
alias -g pl='| wc -l '
alias -g pg=' | grep '
alias va='source .venv/bin/activate'
alias vd='deactivate'

# alias -g pa='pyenv activate '

## Environment management
alias pybook='cd /Users/danthompson/Code/Courses/pydata-book; mamba activate pydata-book'
# activate data_science_env managed by conda/mamba
alias ads='mamba activate data_science_env'

# global aliases
## Main program override
alias -g e="eza -a"
alias -g cat="bat -p"
alias -g b="bat"
alias -g gg="sgpt --repl tempr "
alias -g ggc="sgpt --chat tempc "
alias -g ggn="sgpt "
alias -g cc="it2copy"

alias ww="~/Code/Tools/cloned/whisper-writer/src/start_background_process.zsh"

alias wk="~/Code/Tools/cloned/whisper-writer/src/kill_background_process.zsh"
alias wl="tail -f ~/Code/Tools/cloned/whisper-writer/nohup.out"
alias wd="less -R +F ~/Code/Tools/cloned/whisper-writer/color_diffs.out"

alias wr='if [ -n "$(ps aux | grep "src/km_handler" | grep -v grep)" ]; then echo "Process is running"; else echo "Process is not running"; fi'

alias wf="osascript -e 'tell application \"Keyboard Maestro Engine\" to setvariable \"WhisperRunning\" to \"no\"'"

alias suv="uvicorn server.main:app --reload --host 'localhost' --port 8000"
alias psh="poetry shell"

# function ggr() {
#   cd /Users/danthompson/Code/Tools/cloned/gpt-researcher
#   uvicorn main:app --reload
# }

alias -g ss="gh copilot suggest -t shell "
alias -g ee="gh copilot explain "
alias -g bb="fabric"

# Alias functions

# alias search
alias -g aas="alias | grep "

# alias add
aaa() {
  local alias_type=""
  local alias_name="$1"
  local alias_command="$2"
  local aliases_file="/Users/danthompson/Code/dotfiles/zsh_omz/aliases.zsh"

  # Check if enough arguments are provided
  if [[ -z "$alias_name" || -z "$alias_command" ]]; then
    echo "Usage: adda [-g|-s|-f] <name> <command_or_function>"
    return 1
  fi

  # Handle optional flags
  case "$1" in
  -g)
    alias_type="-g"
    shift
    ;;
  -s)
    alias_type="-s"
    shift
    ;;
  -f)
    alias_type="function"
    shift
    ;;
  esac

  alias_name="$1"
  alias_command="$2"

  # Handle adding functions
  if [[ "$alias_type" == "function" ]]; then
    echo "$alias_name () {" >>"$aliases_file"
    echo "$alias_command" | sed 's/^/    /' >>"$aliases_file"
    echo "}" >>"$aliases_file"
    echo "Function added: $alias_name"
  else
    # Handle global and standard aliases
    echo "alias $alias_type $alias_name='$alias_command'" >>"$aliases_file"
    echo "Alias added: alias $alias_type $alias_name='$alias_command'"
  fi

  # Source the updated aliases file to make the new alias or function immediately available
  source "$aliases_file"
}

# # auto added
