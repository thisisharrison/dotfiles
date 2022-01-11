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

# Shortcuts to directories
alias pinnacle="cd ~/Documents/pinnacle/"
alias ub="cd ~/Documents/pinnacle/ub-frontend-project/"
alias pgame="cd ~/Documents/pinnacle/pgaming-frontend-project/"
alias corefe="cd ~/Documents/pinnacle/core-fe-project/"
alias frontend="cd ~/Documents/pinnacle/frontend-libraries/"
alias harry="cd ~/Documents/coding/"
alias preface="cd ~/Documents/preface/"

# Git aliases
function gc { git commit -m "$@"; }
alias gs="git status";
alias gp="git pull";
alias gf="git fetch";
alias gpush="git push";
alias gd="git diff";
alias ga="git add .";

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

# Handle ARM
# if [ “$(arch)” = “arm64” ]; then
#     eval $(/opt/homebrew/bin/brew shellenv);
#     export PATH=”$PATH:/usr/local/bin:/usr/local/sbin”;
# else
#     eval $(/usr/local/bin/brew shellenv);
#     export PATH=”$PATH:/opt/homebrew/bin:/opt/homebrew/sbin”;
# fi

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
# export SDKMAN_DIR="$HOME/.sdkman"
# [[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
