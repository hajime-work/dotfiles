ドットファイル
==============

使い方

```sh
git clone <REPO> .dotfiles
cd .dotfiles

make 
```

VIM
-------

以下のディレクトリ/ファイルを吐き出します
~/.vimrc: VIMの設定ファイル
~/.vim.d: VIMの設定ファイルディレクトリ
~/.vim.tmp: VIMの一時ファイル置場

ネオバンドル中心です。
補完はneoComplateを使っているので+luaが入ってないVIMでは正常に動きません。


GIT
-------

以下のディレクトリ/ファイルを吐き出します
~/.gitconfig: リポジトリからのシンボリックリンクです
~/.gitconfig.local: なければファイルを作成します [user]セクションのname, emailなどを設定してください

ZSH
-------

以下のディレクトリ/ファイルを吐き出します
~/.zshenv
~/.zshrc
~/.zsh.d

TMUX
-------

~/.tmux.conf
~/.tmux.d
