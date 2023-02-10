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
export MCFLY_FUZZY=2

## deta
# export PATH="/Users/danthompson/.deta/bin:$PATH"
fpath=(~/.zsh.d/ $fpath)
# export PATH="/Users/danthompson/.local/bin:$PATH"

## iTerm
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

## nvm
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# fzf
source /opt/homebrew/share/antigen/antigen.zsh [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# antigen
source /opt/homebrew/share/antigen/antigen.zsh