#
#  ZshのPATH
#


# パス関係の処理 {{{

# 重複したパスを登録しない。
typeset -U path cdpath fpath manpath

## sudo用のパス
typeset -xT SUDO_PATH sudo_path
typeset -U sudo_path
sudo_path=({/usr/local,/usr,}/sbin(N-/))

## path
path=(/bin ~/bin(N-/) /usr/local/bin(N-/) ${path})

if [ $(id -u) -eq 0 ]; then
    path=($sudo_path $path)
fi

# }}}

# vim: ft=sh :
