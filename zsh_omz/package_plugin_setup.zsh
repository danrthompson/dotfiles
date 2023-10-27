export AWS_DEFAULT_PROFILE=admin

# completions
autoload -U bashcompinit
bashcompinit


# vscode
## Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='code'
else
    export EDITOR='nano'
fi


# conda
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/danthompson/mambaforge/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/danthompson/mambaforge/etc/profile.d/conda.sh" ]; then
        . "/Users/danthompson/mambaforge/etc/profile.d/conda.sh"
    else
        export PATH="/Users/danthompson/mambaforge/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

if [ -f "/Users/danthompson/mambaforge/etc/profile.d/mamba.sh" ]; then
    . "/Users/danthompson/mambaforge/etc/profile.d/mamba.sh"
fi
## <<< conda initialize <<<



# deta
## export PATH="/Users/danthompson/.deta/bin:$PATH"
fpath=(~/.zsh.d/ $fpath)
## export PATH="/Users/danthompson/.local/bin:$PATH"

# iTerm
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# antigen
source /opt/homebrew/share/antigen/antigen.zsh

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


# # p10k theme
# ## To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


# Completions
## toggl

#compdef toggl
_toggl() {
  eval $(env COMMANDLINE="${words[1,$CURRENT]}" _TOGGL_COMPLETE=complete-zsh  toggl)
}
if [[ "$(basename -- ${(%):-%x})" != "_toggl" ]]; then
  compdef _toggl toggl
fi

# zsh-autosuggestions
export ZSH_AUTOSUGGEST_STRATEGY=(match_prev_cmd history completion)

# cht.sh
## theme
# other good options: fruity, igor
export CHTSH_QUERY_OPTIONS="style=rrt"

# bat
## theme
export BAT_THEME="Dracula"
## themes considered
# zenburn
# Sublime Snazzy
# OneHalfDark
# Monokai Extended
# Monokai Extended Bright
# Monokai Extended Origin
# Dracula
# DarkNeon
# Coldark-Dark
# 1337

# pager
export PAGER=most
export MANPAGER="sh -c 'col -bx | bat -l man -p'"


# fasd
eval "$(fasd --init zsh-hook zsh-ccomp zsh-ccomp-install \
    zsh-wcomp zsh-wcomp-install)" >> "/dev/null" 2>&1


# check if fasd is installed
## setup
fasd_cache="${ZSH_CACHE_DIR}fasd-init-cache"
if [ "$(command -v fasd)" -nt "$fasd_cache" -o ! -s "$fasd_cache" ]; then
  fasd --init zsh-hook zsh-ccomp zsh-ccomp-install \
    zsh-wcomp zsh-wcomp-install >| "$fasd_cache"
fi
source "$fasd_cache"
unset fasd_cache

## config
_FASD_MAX=5000
_FASD_BACKENDS="native current spotlight"

# Shell-GPT integration ZSH v0.1
_sgpt_zsh() {
if [[ -n "$BUFFER" ]]; then
    _sgpt_prev_cmd=$BUFFER
    BUFFER+="⌛"
    zle -I && zle redisplay
    BUFFER=$(sgpt --shell <<< "$_sgpt_prev_cmd")
    zle end-of-line
fi
}
zle -N _sgpt_zsh
bindkey ^l _sgpt_zsh
# Shell-GPT integration ZSH v0.1

eval "$(fnm env --use-on-cd)"


async_init

# Async load slow things
function async_load_slow_packages() {
    # pyenv
    eval "$(command pyenv init -)"
    eval "$(command pyenv virtualenv-init -)"

    # mcfly
    eval "$(mcfly init zsh)"
    # direnv
    eval "$(direnv hook zsh)"

    # The next line updates PATH for the Google Cloud SDK.
    if [ -f '/Users/danthompson/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/danthompson/Downloads/google-cloud-sdk/path.zsh.inc'; fi
    # The next line enables shell command completion for gcloud.
    if [ -f '/Users/danthompson/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/danthompson/Downloads/google-cloud-sdk/completion.zsh.inc'; fi
}

async_start_worker slow_packages_worker -n
async_register_callback slow_packages_worker async_load_slow_packages
async_job slow_packages_worker async_load_slow_packages

# fast stuff from async load
export MCFLY_FUZZY=2
export NVM_DIR="$HOME/.nvm"