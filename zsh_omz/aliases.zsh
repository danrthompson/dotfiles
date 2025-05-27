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
## Switch MCP server
alias mm='~/Code/danhomebase/scripts/switch_mcp/switch_mcp.zsh'

## Github Copilot
alias -g cs="gh copilot suggest -t shell "
alias -g ce="gh copilot explain "
alias -g csg="gh copilot suggest -t git "
alias -g csh="gh copilot suggest -t gh "

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
# Dan home base
alias ff='cd /Users/danthompson/Code/danhomebase'
alias ffa='cd /Users/danthompson/Code/danhomebase/repos/allowability'
alias fff='/usr/local/bin/cursor /Users/danthompson/Code/danhomebase/danhomebase.code-workspace'
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


# APP ALIASES
## SGPT

# File to store chat and REPL IDs
ID_FILE="$HOME/.sgpt_ids"

# Function to generate a timestamp-based unique ID
generate_id() {
  echo "$(date +%Y_%m_%d_%H_%M_%S)"
}

# Function to update the ID file
update_id_file() {
  sgpt -lc > "$ID_FILE"
}

# Function to remove duplicates and update the most recentID
update_recent_id() {
  local ID="$1"
  grep -v "^$ID$" "$ID_FILE" > "$ID_FILE.tmp" && mv "$ID_FILE.tmp" "$ID_FILE"
  echo "$ID" >> "$ID_FILE"
}

# Function to delete an ID
delete_id() {
  local ID="$1"
  echo "Attempting to delete ID: $ID"

  # Find the file associated with the ID
  local FILE_PATH=$(sgpt -lc | grep "/$ID$")

  # Check if a file was found
  if [[ -n "$FILE_PATH" ]]; then
    echo "Found file: $FILE_PATH"

    # Confirm deletion
    read -q "REPLY?Are you sure you want to delete this chat? (y/n) "
    echo

    if [[ $REPLY =~ ^[Yy]$ ]]; then
      # Delete the file
      rm "$FILE_PATH"
      echo "File deleted: $FILE_PATH"

      # Remove the ID from the ID_FILE
      grep -v "^$ID$" "$ID_FILE" > "$ID_FILE.tmp" && mv "$ID_FILE.tmp" "$ID_FILE"
      echo "ID removed from tracking file"
    else
      echo "Deletion cancelled"
    fi
  else
    echo "No match found for ID: $ID. Aborting deletion."
  fi
}

# Alias for creating a new REPL
ggrn() {
  local REPL_ID=${1:-"repl_$(generate_id)"}
  echo "Chat ID: $REPL_ID"
  sgpt --repl "$REPL_ID"
  update_recent_id "$REPL_ID"
}

# Alias for creating a new chat
ggcn() {
  local PROMPT="$1"
  local CHAT_ID=${2:-"chat_$(generate_id)"}
  echo "Chat ID: $CHAT_ID"
  sgpt --chat "$CHAT_ID" "$PROMPT"
  update_recent_id "$CHAT_ID"
}

# Alias for resuming a REPL
ggrr() {
  local REPL_ID
  if [ -n "$1" ]; then
    REPL_ID="$1"
  else
    REPL_ID=$(tail -n 1 "$ID_FILE")
  fi
  echo "Chat ID: $REPL_ID"
  sgpt --repl "$REPL_ID"
  update_recent_id "$REPL_ID"
}

# Alias for resuming a chat
ggcr() {
  local CHAT_ID
  if [ -n "$1" ]; then
    CHAT_ID="$1"
  else
    CHAT_ID=$(tail -n 1 "$ID_FILE")
  fi
  echo "Chat ID: $CHAT_ID"
  sgpt --chat "$CHAT_ID"
  update_recent_id "$CHAT_ID"
}

ggcl() {
  # list chats
  grep -E '^chat_' "$ID_FILE" | sort -r
}

ggrl() {
  # list repls
  grep -E '^repl_' "$ID_FILE" | sort -r
}

ggsm() {
  # show messages from provided chat ID
  local CHAT_ID="$1"
  sgpt --show-chat "$CHAT_ID"
}


# Alias for anonymous queries
alias -g ggna='sgpt '
alias -g ggs='sgpt '

# Function to list recent IDs
list_recent_ids() {
  echo "Recent IDs:"
  gtac "$ID_FILE" | nl
}

# Alias for resuming a REPL with interactive selection
ggir() {
  local REPL_ID=$(sgpt -lc | awk -F'/' '{print $NF}' | grep '^repl_' | fzf --prompt="Select REPL ID: ")
  if [ -n "$REPL_ID" ]; then
    echo "Chat ID: $REPL_ID"
    sgpt --repl "$REPL_ID"
    update_recent_id "$REPL_ID"
  else
    echo "No REPL ID selected."
  fi
}

# Alias for resuming a chat with interactive selection
ggic() {
  local CHAT_ID=$(sgpt -lc | awk -F'/' '{print $NF}' | grep '^chat_' | fzf --prompt="Select Chat ID: ")
  if [ -n "$CHAT_ID" ]; then
    echo "Chat ID: $CHAT_ID"
    sgpt --chat "$CHAT_ID" "$1"
    update_recent_id "$CHAT_ID"
  else
    echo "No Chat ID selected."
  fi
}


# global aliases
## Main program override
alias -g e="eza -a"
alias -g cat="bat -p"
alias -g b="bat"
# alias -g ggr="sgpt --repl tempr "
# alias -g ggc="sgpt --chat tempc "
alias -g gg="sgpt "
alias -g ggr="sgpt --repl "
alias -g ggc="sgpt --chat "
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

# lint alias for aider
# function lintpy() {
#   cd coach_oll
#   ruff format $*
#   ruff check --fix $*
#   pyright $*
# }

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
