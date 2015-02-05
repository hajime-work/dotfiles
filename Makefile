.PHONY: git zsh vim

prepare:
	make git
	make zsh
	make vim

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
	ln -sf .dotfiles/zsh/_zsh.d $(HOME)/.zsh.d
	touch $@
$(HOME)/.zsh%:
	ln -f ./zsh/$(subst .,_,$(@F)) $(HOME)/

# VIM系の設定
vim:
	make $(HOME)/.vim.d/sential
	make $(HOME)/.vimrc
	make $(HOME)/.vim.tmp/sential

$(HOME)/.vim.tmp/sential:
	mkdir $(HOME)/.vim.tmp
	touch $@

$(HOME)/.vim.d/sential:
	ln -sf .dotfiles/vim/_vim.d $(HOME)/.vim.d
	touch $@
$(HOME)/.vimrc:
	ln -f ./vim/_vimrc $(HOME)/.vimrc
