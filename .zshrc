export ZSH="$HOME/.oh-my-zsh"
ln -fs ~/.config/Dotfiles/.zshrc ~/.zshrc


ZSH_THEME="spaceship"

plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
  zsh-completions
  brew
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


# Make Terminal better
alias cp="cp -iv"                                               # Preferred 'cp' implentation
alias mv="mv -iv"                                               # Preferred 'mv' implentation
alias path='echo -e ${PATH//:/\\n}'                             # path:         Echo all executable Paths
alias pipcorn="npx pipcorn"
alias trash="rm -rf ~/.Trash/*"
alias x="exit"
alias sb="source ~/.bash_profile"
alias hc="history -c"
alias zshrc="nvim ~/.zshrc"
alias v=nvim
alias tmux="tmux -u"

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


function clean-containers() {
    docker rm $(docker ps -a -q)
}

function clean-images() {
    docker rmi $(docker images -q)
}

gpull () {
  git pull $1 $2;
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
