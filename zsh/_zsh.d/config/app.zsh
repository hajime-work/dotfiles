# 
# ZSHの環境設定
#

# ----------------------
# 基本的にエディターはVIMにする
# ----------------------
export EDITOR=vim

# ----------------------
# Vimが居なければVIで仕方ない
# ----------------------
if ! type vim > /dev/null 2>&1; then
    alias vim=vi
fi

# ----------------------
# CDはpushdにする 
# ----------------------
setopt auto_pushd

# CD直後にLSをさせる
function cd() {
    builtin cd $@ && ls --color=auto;
}


# ----------------------
# キーバインド
# ----------------------
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end
bindkey -e # key binding as emacs style

# ----------------------
# LSに色をつける
# ----------------------
export LSCOLORS=exfxcxdxbxegedabagacad
alias ls="ls --color"
alias ll="ls -l"
alias la="ls -a"

# Color Test
function color256() {
for c in {000..255}
do
    echo -n "\e[38;5;${c}m $c"
    [ $(($c%16)) -eq 15 ] && echo
done
echo
}
