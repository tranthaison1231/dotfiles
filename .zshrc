export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/shyn/.oh-my-zsh"

ln -s ~/.config/nvim/.zshrc ~/.zshrc


ZSH_THEME="robbyrussell"

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
alias gitlab="open -a 'Google Chrome' https://gitlab.com/dashboard/projects "
alias github="open -a 'Google Chrome' https://github.com/tranthaison1231?tab=repositories "
alias github_setting="open -a 'Google Chrome' https://github.com/tranthaison1231/SETTING_MACOS_ENV "
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
alias yl="yarn lint"
alias gcl="git clone"
alias zshrc="nvim ~/.zshrc"
alias nvim_init="nvim ~/.config/nvim/init.vim"
alias vim=nvim
alias tmux="tmux -u"
#		NETWORKING
#	---------------------------------------
alias myip='curl -4 icanhazip.com; curl -6 icanhazip.com'       # myip:             Public facing IP Address
alias netCons='lsof -i'                                         # netCons:          Show all open TCP/IP sockets
alias flushDNS='sudo killall -HUP mDNSResponder'                # flushDNS:         Flush out the DNS Cache
alias lsock='sudo /usr/sbin/lsof -i -P'                         # lsock:            Display open sockets
alias lsockU='sudo /usr/sbin/lsof -nP | grep UDP'               # lsockU:           Display only open UDP sockets
alias lsockT='sudo /usr/sbin/lsof -nP | grep TCP'               # lsockT:           Display only open TCP sockets
alias openPorts='sudo lsof -i | grep LISTEN'                    # openPorts:        All listening connections
alias showBlocked='sudo ipfw list'                              # showBlocked:      All ipfw rules inc/ blocked IPs
alias gv='git version'                              # showBlocked:      All ipfw rules inc/ blocked IPs
alias clr="clear"

alias ip4="ip -4"
alias ip6="ip -6"

#	---------------------------------------

gpush () {
  ga . && gcmsg $1 && ggpush;
}

gpull () {
  git pull $1 $2;
}

gpush--amend (){
  ga . && git commit --amend $1 && ggpush -f; 
}

export NVM_DIR="/Users/shyn/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

export PATH="$PATH:/Users/shyn/flutter/bin"
