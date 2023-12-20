install_oh_my_zsh() {
	echo "Setting up zsh..." &&
		rm -rf ~/.oh-my-zsh &&
		rm -rf .zsh_history &&
		sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" &&
		echo "Finished dowload package plugin for zshrc."
}

install_gem() {
	echo "Setting up gem...." &&
		echo 6526393son | sudo gem install colorls
}

install_homebrew() {
	echo "Setting up homebrew..." &&
		/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" &&
		echo 6526393son | sudo easy_install pip &&
		brew install yarn &&
		brew install tmux &&
		brew install watchman &&
		brew install zsh-completions &&
		brew install ruby &&
		brew install zsh-syntax-highlighting &&
		brew uninstall --force postgresql &&
		brew cask install iterm2 &&
		rm -rf /usr/local/var/postgres &&
		brew install postgres &&
		brew install nvm &&
		brew install diff-so-fancy &&
		brew install exa &&
		brew update &&
		brew tap caskroom/cask &&
		brew search visual-studio-code &&
		brew cask info visual-studio-code &&
		brew cask install visual-studio-code &&
		brew tap homebrew/cask-fonts &&
		brew cask install font-hack-nerd-font &&
		brew cask install font-fira-code &&
		brew tap jondot/tap &&
		brew install hygen &&
		brew install koekeishiya/formulae/yabai &&
		brew install koekeishiya/formulae/skhd &&
		brew cleanup &&
		echo "Successing to setting homebrew..."
}

if [[ -z $1 ]]; then
	echo "This will delete all your previous homebrew, nvim, zsh settings. Proceed? (y/n)? "
	read answer
	if echo "$answer" | grep -iq "^y"; then
		echo "Installing dependencies..." &&
			install_homebrew &&
			install_gem &&
			install_oh_my_zsh &&
			echo "Finished installation."
	fi
else
	"install_$1" $1
fi
