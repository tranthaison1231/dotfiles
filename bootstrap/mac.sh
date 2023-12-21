install_homebrew() {
	read -r -p "Do you want to install homebrew? [y|N] " response
	if [[ $response =~ (y|yes|Y) ]]; then
		git clone https://github.com/Homebrew/brew homebrew
		brew update --force --quiet
		eval "$(homebrew/bin/brew shellenv)"

		chmod -R go-w "$(brew --prefix)/share/zsh"

		ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
		brew tap homebrew/cask

		success "Installed homebrew"
	fi
}

install_oh_my_zsh() {
	echo "Setting up zsh..."
	rm -rf ~/.oh-my-zsh
	rm -rf .zsh_history
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	echo "Finished download package plugin for zshrc."
}

install_tools() {
	read -r -p "Do you want to install some amazing tools ? [y|N] " response
	if [[ $response =~ (y|yes|Y) ]]; then
		# Termnial
		brew install --cask wezterm
		brew install tmux
		brew install neovim
		brew install diff-so-fancy
		brew install lazygit
		brew install fzf
		brew install lua
		brew install luarocks
		luarocks --local --lua-version 5.1 install magick

		# Zsh
		brew install zsh-completions
		brew install zsh-syntax-highlighting
		brew install zsh-autosuggestions

		# Font
		brew tap homebrew/cask-fonts
		brew cask install font-hack-nerd-font
		brew cask install font-fira-code-nerd-font
		brew cask install font-fira-code

		# Manage windows
		brew install koekeishiya/formulae/yabai
		brew install koekeishiya/formulae/skhd

		# Languages
		# nodejs
		brew install pnpm
		brew install node
		brew install nvm

		# golang
		brew install go

		# Another
		brew install --cask raycast
		brew install --cask notion
		brew install --cask arc
		brew install --cask kap
		brew install --cask orbstack
		brew install --cask slack
		brew install --cask discord

		echo "Successful to setting homebrew..."
	fi
}

setup_git() {
	read -r -p "Do you want to setup git? [y|N] " response
	if [[ $response =~ (y|yes|Y) ]]; then
		git config --global user.email "$1"
		git config --global user.name "$2"
		git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX"
		git config --global color.ui true
		git config --global color.diff-highlight.oldNormal "red bold"
		git config --global color.diff-highlight.oldHighlight "red bold 52"
		git config --global color.diff-highlight.newNormal "green bold"
		git config --global color.diff.meta "11"
		git config --global color.diff.frag "magenta bold"
		git config --global color.diff.commit "yellow bold"
		git config --global color.diff.old "red bold"
		git config --global color.diff.new "green bold"
		git config --global color.diff.whitespace "red reverse"
	fi
	echo "Setup Git Successfully"
}

read -r -p "This will delete all your previous homebrew, nvim, zsh settings. Proceed? (y/n)? " response
if [[ $response =~ (y|yes|Y) ]]; then
	echo "Installing dependencies..."
	install_homebrew
	install_homebrew_tolls
	install_oh_my_zsh
	echo "Finished installation."
fi
