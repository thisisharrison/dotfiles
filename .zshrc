#!/usr/bin/env bash

# HOMEBREW
if [ “$(arch)” = “arm64” ]; then
    local brew_path="/opt/homebrew/bin"
    local brew_opt_path="${brew_opt_path}"
    export PATH="${brew_path}:${PATH}"

    # NVM for arm64
    local nvm_path="$HOME/.nvm"
    export NVM_DIR="${nvm_path}"

    [ -s "${brew_opt_path}/nvm/nvm.sh" ] && . "${brew_opt_path}/nvm/nvm.sh"  # This loads nvm
    [ -s "${brew_opt_path}/nvm/etc/bash_completion.d/nvm" ] && . "${brew_opt_path}/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
else 
    # NVM for i386
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
fi

# PYTHON
export PYENV_ROOT="$HOME/.pyenv" 
export PATH="$PYENV_ROOT/bin:$PATH" 
