.PHONY: git zsh vim tmux conky

prepare:
	make git
	make zsh
	make vim
	make tmux

#
# GIT系の設定
#
git:
	make $(HOME)/.gitconfig
	make $(HOME)/.gitconfig.local
$(HOME)/.gitconfig:
	ln -f ./git/_gitconfig $(HOME)/.gitconfig
$(HOME)/.gitconfig.local:
	cp -v ./git/_gitconfig.local $(HOME)/.gitconfig.local

#
# ZSH系の設定
#
zsh: 
	make $(HOME)/.zsh.d/sential
	make $(HOME)/.zshenv
	make $(HOME)/.zshrc
$(HOME)/.zsh.d/sential:
	ln -sf .dotfiles/zsh/_zsh.d $(HOME)/.zsh.d
	touch $@
$(HOME)/.zsh%:
	ln -f ./zsh/$(subst .,_,$(@F)) $@

#
# VIM系の設定
#
vim:
	make $(HOME)/.vim.d/sential
	make $(HOME)/.vimrc
	make $(HOME)/.vimrc.local
	make $(HOME)/.vim.tmp/sential

$(HOME)/.vim.tmp/sential:
	mkdir $(HOME)/.vim.tmp
	touch $@

$(HOME)/.vim.d/sential:
	ln -sf .dotfiles/vim/_vim.d $(HOME)/.vim.d
	touch $@
	$(HOME)/.vimrc: ./vim/_vimrc
	ln -f ./vim/_vimrc $(HOME)/.vimrc
$(HOME)/.vimrc.local:
	touch $@
	
#
# TMUX系の設定
#
tmux:
	make $(HOME)/.tmux.d/sential
	make $(HOME)/.tmux.conf

$(HOME)/.tmux.d/sential:
	ln -sf .dotfiles/tmux/_tmux.d $(HOME)/.tmux.d
	touch $@

$(HOME)/.tmux.conf:
	ln -f ./tmux/_tmux.conf $(HOME)/.tmux.conf
#
# Conky
#
conky:
	ln -f ./_conkyrc $(HOME)/.conkyrc
