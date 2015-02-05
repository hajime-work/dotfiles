.PHONY: git zsh

prepare:
	make git
	make zsh

# GIT系の設定
git:
	make $(HOME)/.gitconfig
	make $(HOME)/.gitconfig.local

$(HOME)/.gitconfig:
	ln -f ./git/_gitconfig $(HOME)/.gitconfig
$(HOME)/.gitconfig.local:
	ln -f ./git/_gitconfig.local $(HOME)/.gitconfig.local

# ZSH系の設定
zsh: 
	make $(HOME)/.zsh.d/sential
	make $(HOME)/.zshenv
	make $(HOME)/.zshrc

$(HOME)/.zsh.d/sential:
	ln -sf .dotfiles/zsh/_zsh.d $(HOME)/
	touch $@

$(HOME)/%:
	ln -f ./zsh/$(subst .,_,$(@F)) $(HOME)/
