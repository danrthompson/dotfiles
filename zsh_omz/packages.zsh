## vscode
# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='code'
else
    export EDITOR='nano'
fi

## goku setup
export GOKU_EDN_CONFIG_FILE="/Users/danthompson/Dropbox/karabiner/karabiner.edn"

## conda
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

if [ -f "/Users/danthompson/mambaforge/etc/profile.d/mamba.sh" ]; then
    . "/Users/danthompson/mambaforge/etc/profile.d/mamba.sh"
fi
# <<< conda initialize <<<


## mcfly
eval "$(mcfly init zsh)"

## deta
# export PATH="/Users/danthompson/.deta/bin:$PATH"
fpath=(~/.zsh.d/ $fpath)
# export PATH="/Users/danthompson/.local/bin:$PATH"

## iTerm
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

## nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

