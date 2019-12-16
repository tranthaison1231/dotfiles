export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/shyn/.oh-my-zsh"
export PATH="$PATH:/Users/shyn/flutter/bin"
export NVM_DIR="/Users/shyn/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

ln -fs ~/.config/nvim/.zshrc ~/.zshrc
# ln -sf "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"

ZSH_THEME="spaceship"

plugins=(
  iterm2
  git
  vi-mode
  bundler
  command-not-found
  copydir
  copyfile
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

#	MAKE TERMINAL BETTER
#	-----------------------------------------

alias cp="cp -iv"                                               # Preferred 'cp' implentation
alias mv="mv -iv"                                               # Preferred 'mv' implentation
alias mkdir="mkdir -pv"                                         # Preferred 'mkdir' implentation
alias ...='cd ../../'                                           # Go back 2 directory levels
alias .3='cd ../../../'                                         # Go back 3 directory levels
alias .4='cd ../../../../'                                      # Go back 4 directory levels
alias .5='cd ../../../../../'                                   # Go back 5 directory levels
alias .6='cd ../../../../../../'                                # Go back 6 directory levels
alias path='echo -e ${PATH//:/\\n}'                             # path:         Echo all executable Paths

alias youtube="open -a 'Google Chrome' http://www.youtube.com "
alias facebook="open -a 'Google Chrome' http://www.facebook.com "
alias messenger="open -a 'Google Chrome'https://www.messenger.com/ "
alias trello="open -a 'Google Chrome' http://www.trello.com "
alias skype="open -a 'Google Chrome' https://web.skype.com/ "
alias google="open -a 'Google Chrome' https://www.google.com/ "
alias twitter="open -a 'Google Chrome' https://twitter.com/home"
alias discord="open -a 'Google Chrome' https://discordapp.com/channels/@me"
alias gitlab="open -a 'Google Chrome' https://gitlab.com/dashboard/projects "
alias github="open -a 'Google Chrome' https://github.com/tranthaison1231?tab=repositories "
alias shyn="open -a 'Google Chrome' https://github.com/tranthaison1231/SETTING_MACOS_ENV "
alias gmail"open -a 'Google Chrome' https://mail.google.com/mail/u/0/?tab=wm&ogbl"
alias figma="open -a 'Google Chrome' https://www.figma.com/files/recent "
alias zeplin="open -a 'Google Chrome' https://app.zeplin.io/projects "
alias postman="open -a 'Google Chrome' https://chrome.google.com/webstore/detail/postman/fhbjgbiflinjbdggehcddcbncdddomop?hl=en "
alias photoshop="open -a 'Adobe Photoshop CC 2019' "
alias reddit="open -a 'Google Chrome' https://www.reddit.com "
alias medium="open -a 'Google Chrome' https://medium.com/ "
alias instagram="open -a 'Google Chrome' https://www.instagram.com/ "
alias codepen="open -a 'Google Chrome' https://codepen.io/dashboard/ "
alias codesandbox="open -a 'Google Chrome' https://codesandbox.io/dashboard/recent "
alias netflix="open -a 'Google Chrome' https://www.netflix.com/browse "
alias macvim="open -a 'macvim' "
alias calendar="open -a 'Calendar' "
alias translate="open -a 'Google Chrome' https://www.google.com/search?q=translate "
alias xd="open -a 'Adobe XD' "
alias trash="rm -rf ~/.Trash/*"
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
alias gms="git merge --squash"
alias nis="npm install --save "


git-standup() {
    AUTHOR=${AUTHOR:="`git config user.name`"}

    since=yesterday
    if [[ $(date +%u) == 1 ]] ; then
        since="2 days ago"
    fi

    git log --all --since "$since" --oneline --author="$AUTHOR"
}

#---------------Config for neovim-----------------------
alias zshrc="nvim ~/.zshrc"
alias nvim_init="nvim ~/.config/nvim/init.vim"
alias vim=nvim
alias tmux="tmux -u"
#---------------DOCKER----------------------------------
alias d="docker"
alias dimg="docker images"
alias dpull="docker pull"
alias dps="docker ps"
alias dc="docker-compose"
alias dr="docker run"
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
  hg            # Mercurial section (hg_branch  + hg_status)
  package       # Package version
  node          # Node.js section
  ruby          # Ruby section
  elixir        # Elixir section
  xcode         # Xcode section
  swift         # Swift section
  golang        # Go section
  php           # PHP section
  rust          # Rust section
  haskell       # Haskell Stack section
  julia         # Julia section
  docker        # Docker section
  aws           # Amazon Web Services section
  venv          # virtualenv section
  conda         # conda virtualenv section
  pyenv         # Pyenv section
  dotnet        # .NET section
  ember         # Ember.js section
  kubecontext   # Kubectl context section
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
