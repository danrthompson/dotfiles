# vscode
## Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='code'
else
    export EDITOR='nano'
fi

# goku setup
export GOKU_EDN_CONFIG_FILE="/Users/danthompson/Dropbox/karabiner/karabiner.edn"

# conda
## >>> conda initialize >>>
## !! Contents within this block are managed by 'conda init' !!
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

if [ -f "/Users/danthompson/mambaforge/etc/profile.d/mamba.sh" ]; then
    . "/Users/danthompson/mambaforge/etc/profile.d/mamba.sh"
fi
## <<< conda initialize <<<


# mcfly
eval "$(mcfly init zsh)"
export MCFLY_FUZZY=2

# deta
## export PATH="/Users/danthompson/.deta/bin:$PATH"
fpath=(~/.zsh.d/ $fpath)
## export PATH="/Users/danthompson/.local/bin:$PATH"

# iTerm
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
## completion
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# fzf
source /opt/homebrew/share/antigen/antigen.zsh [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# antigen
source /opt/homebrew/share/antigen/antigen.zsh

# p10k theme
## To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
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
if [[ "$commands[fasd]" -nt "$fasd_cache" || ! -s "$fasd_cache" ]]; then
  fasd --init zsh-hook zsh-ccomp zsh-ccomp-install \
    zsh-wcomp zsh-wcomp-install >| "$fasd_cache"
fi
source "$fasd_cache"
unset fasd_cache

## config
_FASD_MAX=5000
_FASD_BACKENDS="native current spotlight"