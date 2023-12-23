export ZSH="$HOME/.oh-my-zsh"
ln -fs ~/.config/nvim/.zshrc ~/.zshrc
ln -fs ~/.config/lazygit/config.yml ~/Library/Application\ Support/lazygit/config.yml

ZSH_THEME="dracula"

plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
  zsh-completions
  brew
)

source $ZSH/oh-my-zsh.sh


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


# Recursively delete `.DS_Store` files
alias cleanup="find . -name '*.DS_Store' -type f -ls -delete"

function clean-containers() {
    docker rm $(docker ps -a -q)
}

function clean-images() {
    docker rmi $(docker images -q)
}

gpull () {
  git pull $1 $2;
}


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# bun completions
[ -s "/Users/thaison.coderstokyogmail.com/.bun/_bun" ] && source "/Users/thaison.coderstokyogmail.com/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
