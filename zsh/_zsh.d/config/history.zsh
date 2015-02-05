# 
# ZSHの環境設定
#

# ----------------------
# コマンド履歴
# -----------------------
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt bang_hist
setopt extended_history
setopt share_history
setopt hist_ignore_all_dups
autoload history-search-end
