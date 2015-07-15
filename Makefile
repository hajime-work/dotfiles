.PHONY: git zsh vim tmux conky

install:
	git submodule init
	git submodule update
	make git
	make zsh
	make vim
	make tmux


#
# GIT系の設定
#
git:
	# ファイルがある、しかしリンクじゃない場合は.localにコピー
	if [ -s $(HOME)/.gitconfig ]; then if [ ! -L $(HOME)/.gitconfig ]; then cat $(HOME)/.gitconfig >> $(HOME)/.gitconfig.local ; fi;  fi;
	# ローカルがなければ
	if [ -s $(HOME)/.gitconfig.local ]; then touch $(HOME)/.gitconfig.local; fi;
	# リンクを貼る
	ln -sf .dotfiles/git/_gitconfig $(HOME)/.gitconfig

#
# ZSH系の設定
#
zsh: 
	# ファイルがある、しかしリンクじゃない場合は.localにコピー
	if [ -s $(HOME)/.zshrc ]; then if [ ! -L $(HOME)/.zshrc ]; then cat $(HOME)/.zshrc >> $(HOME)/.zshrc.local ; fi;  fi;
	if [ -s $(HOME)/.zshenv ]; then if [ ! -L $(HOME)/.zshenv ]; then cat $(HOME)/.zshenv >> $(HOME)/.zshenv.local ; fi;  fi;
	# ローカルがなければ
	touch $(HOME)/.zshrc.local
	touch $(HOME)/.zshenv.local
	# リンクを貼る
	ln -sf .dotfiles/zsh/_zsh.d $(HOME)/.zsh.d
	ln -sf .dotfiles/zsh/_zshrc  $(HOME)/.zshrc
	ln -sf .dotfiles/zsh/_zshenv  $(HOME)/.zshenv

#
# VIM系の設定
#
vim:
	# ファイルがある、しかしリンクじゃない場合は.localにコピー
	if [ -s $(HOME)/.vimrc ]; then if [ ! -L $(HOME)/.vimrc ]; then cat $(HOME)/.vimrc >> $(HOME)/.vimrc.local ; fi;  fi;
	touch $(HOME)/.vimrc.local
	-mkdir $(HOME)/.vim.tmp
	ln -sf .dotfiles/vim/_vim.d $(HOME)/.vim.d
	ln -sf .dotfiles/vim/_vimrc $(HOME)/.vimrc

	
#
# TMUX系の設定
#
tmux:
	# ファイルがある、しかしリンクじゃない場合は.localにコピー
	if [ -s $(HOME)/.tmux.conf ]; then if [ ! -L $(HOME)/.tmux.conf ]; then cat $(HOME)/.tmux.conf >> $(HOME)/.tmux.conf.local ; fi;  fi;
	ln -sf .dotfiles/tmux/_tmux.d $(HOME)/.tmux.d
	ln -sf .dotfiles/tmux/_tmux.conf $(HOME)/.tmux.conf
#
# Conky
#
conky:
	ln -f ./_conkyrc $(HOME)/.conkyrc
