# VS Code
alias code="\"/Applications/Visual Studio Code.app/Contents/Resources/app/bin/code\""
function c { code ${@:-.} }

# GIT
function gc { git commit -m "$@"; }
alias gs="git status";
alias gp="git pull";
alias gf="git fetch";
alias gpush="git push";
alias gd="git diff";
alias ga="git add .";
alias gb="git branch --sort=-committerdate"
alias gb:name="gb --format='%(if)%(HEAD)%(then)%(color:green)* %(authorname) %(refname:short)%(else)  %(authorname) %(refname:short)%(end)'"

# YARN
alias y="yarn"
alias yinit="y init"
alias yr="y run"
alias ys="y start"
alias yb="y build"
alias yt="y test"
alias yarn-update="y upgrade-interactive --latest";

# NPM
alias ninit="npm init"
alias ni="npm install"
alias ns="npm run start -s --"
alias nb="npm run build -s --";
alias nd="npm run dev -s --";
alias nt="npm run test -s --";
alias ntw="npm run test:watch -s --";
alias rmn="rm -rf node_modules"

#PYTHON
alias python="python3"

# Bash alias 
alias ll="ls --color=auto -alF"

# SHORTCUTS TO DIRECTORIES
alias preface="cd ~/Documents/preface"
alias coding="cd ~/Documents/coding"
alias project="cd ~/Documents/projects"
