export PATH=$HOME/bin:/usr/local/bin:$PATH
source $(dirname $(gem which colorls))/tab_complete.sh


# Path for your nvim
export NVM_DIR=~/.nvm

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export PATH="$PATH:$HOME/flutter/bin"
[[ -s $HOME/.nvm/nvm.sh ]] && . $HOME/.nvm/nvm.sh  # This loads NVM

ln -fs ~/.config/nvim/.zshrc ~/.zshrc
# ln -sf "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"



ZSH_THEME="spaceship"

plugins=(
  iterm2
  git
  vi-mode
  command-not-found
  dotenv
  docker-compose
  osx
  common-aliases  
  zsh-autosuggestions
  zsh-syntax-highlighting
  colored-man-pages
  colorize
  zsh-completions
  yarn
  npm
  brew
  osx
  nvm
  dotenv
  colorize
)

source $ZSH/oh-my-zsh.sh


# Add android PATH ( React Native and Flutter )
export PATH="$PATH:$HOME/flutter/bin" # Config for flutter
export LC_ALL=en_US.UTF-8
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export ANDROID_HOME=/Applications/ADT/sdk
export PATH=~/Library/Android/sdk/tools:$PATH
export PATH=~/Library/Android/sdk/platform-tools:$PATH
export PSQL_DIR=/usr/local/pgsql/bin/
export PATH="$PSQL_DIR:$PATH"


# Add Go Development 
export GOPATH="${HOME}/.go"
export GOROOT="$(brew --prefix golang)/libexec"
export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"
test -d "${GOPATH}" || mkdir "${GOPATH}"
test -d "${GOPATH}/src/github.com" || mkdir -p "${GOPATH}/src/github.com"


# Make Terminal better
alias cp="cp -iv"                                               # Preferred 'cp' implentation
alias mv="mv -iv"                                               # Preferred 'mv' implentation
alias mkdir="mkdir -pv"                                         # Preferred 'mkdir' implentation
alias src="source"
alias ...='cd ../../'                                           # Go back 2 directory levels
alias .3='cd ../../../'                                         # Go back 3 directory levels
alias .4='cd ../../../../'                                      # Go back 4 directory levels
alias .5='cd ../../../../../'                                   # Go back 5 directory levels
alias .6='cd ../../../../../../'                                # Go back 6 directory levels
alias path='echo -e ${PATH//:/\\n}'                             # path:         Echo all executable Paths
alias ls='colorls'

alias pipcorn="npx pipcorn"
alias trash="rm -rf ~/.Trash/*"
alias x="exit"
alias sb="source ~/.bash_profile"
alias hc="history -c"
alias nis="npm install --save "
#---------------GITHUB---------------------------------
alias git_edit="ga . && gcmsg 'Fix something' && ggpush"
alias git_init="ga . && gcmsg 'Init project' && ggpush"
alias gi="git init"
alias gl='git log --graph --oneline --all --decorate'
alias gbr="git branch | grep -v "master" | xargs git branch -D"
alias gcl="git clone"
alias gc="git commit -m"
alias gnah="!git reset --hard && git clean -df"
alias gamend="git add . && git commit --amend --no-edit"
alias gu="git pull --rebase"
alias gum="git pull origin master --rebase"
alias gmc="git merge --continue"
alias gus="git pull origin staging --rebase"
alias gud="git pull origin develop --rebase"
alias gur="git pull origin release --rebase"
alias gms="git merge --squash"
alias grs="git reset"


# kubernetes shortcut
alias k='kubectl'
alias kk='kubectl get all'
alias wk='watch kubectl get all'
alias kga='kubectl get --all-namespaces'
alias kg='kubectl get'
alias kc='kubectl create -f'
alias ka='kubectl apply -f'
alias kdel='kubectl delete -f'
alias kcdel='kubectl delete configmap'
alias kd='kubectl describe'
alias kl='kubectl logs'
alias ke='kubectl exec -it'
alias kcontext='kubectl config set-context $(kubectl config current-context)' # add --namespace=<ns>
alias kdelete='kubectl delete --grace-period=0 --force po'
alias kwp='watch kubectl get pod -owide'
kct () { kubectl config use-context $1 }
kns () { kubectl config set-context $(kubectl config current-context) --namespace=$1 }
kdevict() { kubectl get pods | grep Evicted | awk '{print $1}' | xargs kubectl delete pod }



git-standup() {
    AUTHOR=${AUTHOR:="`git config user.name`"}

    since=yesterday
    if [[ $(date +%u) == 1 ]] ; then
        since="2 days ago"
    fi

    git log --all --since "$since" --oneline --author="$AUTHOR"
}
#---------------Confif for nmp--------------------------
alias npmr="npm run"
#---------------Config for neovim-----------------------
alias zshrc="nvim ~/.zshrc"
alias nvim_init="nvim ~/.config/nvim/init.vim"
alias v=nvim
alias tmux="tmux -u"
#---------------DOCKER----------------------------------
alias d="docker"
alias dopen="open --background -a Docker"
alias dimg="docker image"
alias dimgs="docker images"
alias dpull="docker pull"
alias dps="docker ps"
alias dc="docker-compose"
alias dr="docker run"
alias drmif="docker rmi -f"
alias db="docker build"
#---------------Flutter---------------------------------
alias fld="flutter doctor"https://nehttps://nestjs-now.thaisoncoderstokyo.now.shstjs-now.thaisoncoderstokyo.now.sh

#---------------NETWORKING------------------------------
alias myip='curl -4 icanhazip.com; curl -6 icanhazip.com'       # myip:             Public facing IP Address
alias netCons='lsof -i'                                         # netCons:          Show all open TCP/IP sockets
alias flushDNS='sudo killall -HUP mDNSResponder'                # flushDNS:         Flush out the DNS Cache
alias lsock='sudo /usr/sbin/lsof -i -P'                         # lsock:            Display open sockets
alias lsockU='sudo /usr/sbin/lsof -nP | grep UDP'               # lsockU:           Display only open UDP sockets
alias lsockT='sudo /usr/sbin/lsof -nP | grep TCP'               # lsockT:           Display only open TCP sockets
alias openPorts='sudo lsof -i | grep LISTEN'                    # openPorts:        All listening connections
alias showBlocked='sudo ipfw list'                              # showBlocked:      All ipfw rules inc/ blocked IPs
alias gv='git version'                              # showBlocked:      All ipfw rules inc/ blocked IPs
alias cl="clear"
alias ip4="ip -4"
alias ip6="ip -6"
#---------For yarn--------------------------------
alias yri='rm -rf node_modules && rm -rf yarn.lock && yarn cache clean && yarn'
alias yl="yarn lint"
#----------For home brew---------------------------
alias bsl='brew services list'
alias bi='brew install'
alias br='brew remove'
# ---------For POSTGRES SQL DATABASE----------------
alias pg-start='pg_ctl -D /usr/local/var/postgres start'
alias pg-stop='pg_ctl -D /usr/local/var/postgres stop -s -m fast'
# alias pg-restart=''
# ---------For MY SQL-------------------------------
alias ms-start='sudo /usr/local/mysql/support-files/mysql.server start'
alias ms-stop='sudo /usr/local/mysql/support-files/mysql.server stop'
alias ms-restart='sudo /usr/local/mysql/support-files/mysql.server restart'
# ---------For MONGODB------------------------------
# alias pg-start='pg_ctl -D /usr/local/var/postgres start'
# alias pg-stop='pg_ctl -D /usr/local/var/postgres stop -s -m fast'

#	---------------------------------------
# Generate a self-signed certificate: https://timonweb.com/posts/running-expressjs-server-over-https/
alias gn-server-key='openssl req -nodes -new -x509 -keyout server.key -out server.cert' 

# --------Block web------------
# https://www.laptopmag.com/articles/block-websites-mac
alias block_web='sudo nvim /etc/hosts'
alias save_block_web='sudo dscacheutil -flushcache'
#---------Tmux
alias tmuxa="tmux attach -t"
alias tmuxn="tmux new -s"
alias tmuxk="tmux kill -t"
alias tmuxl="tmux ls"

#--------------Lerna----------------------
alias lp="lerna publish"
alias lv="lerna version"
alias lb="lerna bootstrap"
alias ll="lerna list"
alias lcg="lerna changed"
alias ld="lerna diff"
alias le="lerna exec"
alias lr="lerna run"
alias li="lerna init"
alias la="lerna add"
alias lcl="lerna clean"
alias l="lerna"
alias lim="lerna import"

function clean-containers() {
    docker rm $(docker ps -a -q)
}

function clean-images() {
    docker rmi $(docker images -q)
}


gpush () {
  ga . && gcmsg $1 && ggpush;
}

gpull () {
  git pull $1 $2;
}

gpush--amend (){
  ga . && git commit --amend $1 && ggpush -f; 
}

#---------Config for Spaceship Prompt---------
SPACESHIP_PROMPT_ORDER=(
  time          # Time stamps section
  user          # Username section
  dir           # Current directory section
  host          # Hostname section
  git           # Git section (git_branch + git_status)
  package       # Package version
  node          # Node.js section
  ruby          # Ruby section
  elixir        # Elixir section
  xcode         # Xcode section
  golang        # Go section
  rust          # Rust section
  haskell       # Haskell Stack section
  julia         # Julia section
  docker        # Docker section
  aws           # Amazon Web Services section
  venv          # virtualenv section
  pyenv         # Pyenv section
  dotnet        # .NET section
  ember         # Ember.js section
  terraform     # Terraform workspace section
  exec_time     # Execution time
  line_sep      # Line break
  battery       # Battery level and status
  vi_mode       # Vi-mode indicator
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
