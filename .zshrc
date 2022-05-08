#!/usr/bin/env bash

# Load version control information
autoload -Uz vcs_info
precmd() { vcs_info }

# Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:git:*' formats '%F{yellow}(%b)%f '
 
# Set up the prompt (with git branch name)
setopt PROMPT_SUBST
PROMPT='%F{cyan}%2~%f ${vcs_info_msg_0_}'

export JAVA_HOME=`/usr/libexec/java_home -v 15.0.2`

export ANDROID_HOME=$HOME/Library/Android/sdk
export ANDROID_SDK_ROOT=$ANDROID_HOME
export ANDROID_AVD_HOME=$HOME/.android/avd
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=/usr/local/bin/sbt:$PATH
export PYTHONPATH=/usr/local/bin/python3

alias python="python3"
alias code="\"/Applications/Visual Studio Code.app/Contents/Resources/app/bin/code\""
function c { code ${@:-.} }

# Git aliases
function gc { git commit -m "$@"; }
alias gs="git status";
alias gp="git pull";
alias gf="git fetch";
alias gpush="git push";
alias gd="git diff";
alias ga="git add .";
alias gb="git branch --sort=-committerdate"
alias gb:name="gb --format='%(if)%(HEAD)%(then)%(color:green)* %(authorname) %(refname:short)%(else)  %(authorname) %(refname:short)%(end)'"

# Yarn aliases 
alias y="yarn"
alias yinit="y init"
alias yr="y run"
alias ys="y start"
alias yb="y build"
alias yt="y test"
alias yarn-update="y upgrade-interactive --latest";

# NPM aliases
alias ninit="npm init"
alias ni="npm install"
alias ns="npm run start -s --"
alias nb="npm run build -s --";
alias nd="npm run dev -s --";
alias nt="npm run test -s --";
alias ntw="npm run test:watch -s --";
alias rmn="rm -rf node_modules"

# Bash alias 
alias ll="ls --color=auto -alF"

# Company
alias company="cd $HOME/Documents/company"
# Personal
alias personal="cd $HOME/Documents/personal"

# Handle ARM
if [ “$(arch)” = “arm64” ]; then
    # Homebrew
    export PATH=/opt/homebrew/bin:$PATH
    # # Java
    # export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
    # export CPPFLAGS="-I/opt/homebrew/opt/openjdk/include"
    # # Scala
    # export SCALA_HOME="/opt/homebrew/bin/scala"
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

nvm alias default 16
