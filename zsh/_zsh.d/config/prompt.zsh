# 
# ZSHの環境設定
#

# ----------------------
# プロンプトの設定
# ----------------------

setopt prompt_subst
setopt prompt_percent
setopt transient_rprompt

#local KAO1="(*'-')/"
#local KAO2="(*;-;%)<"

#local KAO1="(´・ω・)/"
#local KAO2="(´；ω；%)/"

local mark_color_1=036
local mark_color_2=009
local normal_color=243
local kao_color_1=042
local kao_color_1=193
local kao_color_2=202
local host_color=220
local directory_color=051
local name_color=084

local KAO1="@='-']"
local KAO2="@=^-^]" \
local MARK='%B%(!,%F{'$mark_color_2'}#%f,%F{'$mark_color_1'}>%f)%f%b '
local KAO='%(?!%F{'$kao_color_1'}'${KAO1}'!%F{'$kao_color_2'}'${KAO2}')%f'
#local prompt_fqdn="%B%F{$host_color}`hostname -f`%f%b%F{$normal_color}"
local prompt_fqdn="%F{$host_color}`hostname -f`%f%F{$normal_color}"
local prompt_directory="%F{$directory_color}%d%f%F{$normal_color}"
local prompt_name="%F{$name_color}%n%f%F{$normal_color}"
#PROMPT="%F{$normal_color}<<$prompt_name at %F{$host_color}%m%f%F{$normal_color}>>%f%F{$normal_color} - [$prompt_directory] 
PROMPT="$prompt_name@$prompt_fqdn - $prompt_directory
$KAO $MARK"
PROMPT2="$KAO %F{gray}---<%f "

autoload -Uz add-zsh-hook
autoload -Uz colors
colors
autoload -Uz vcs_info

zstyle ':vcs_info:*' enable git svn hg bzr
zstyle ':vcs_info:*' formats '(%s)-[%b]'
zstyle ':vcs_info:*' actionformats '(%s)-[%b|%a]'
zstyle ':vcs_info:(svn|bzr):*' branchformat '%b:r%r'
zstyle ':vcs_info:bzr:*' use-simple true

autoload -Uz is-at-least
if is-at-least 4.3.10; then
  # この check-for-changes が今回の設定するところ
  zstyle ':vcs_info:git:*' check-for-changes true
  zstyle ':vcs_info:git:*' stagedstr "+"    # 適当な文字列に変更する
  zstyle ':vcs_info:git:*' unstagedstr "-"  # 適当の文字列に変更する
  zstyle ':vcs_info:git:*' formats '(%s)-[%b] %c%u'
  zstyle ':vcs_info:git:*' actionformats '(%s)-[%b|%a] %c%u'
fi

function _update_vcs_info_msg() {
    psvar=()
    LANG=en_US.UTF-8 vcs_info
    [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}
add-zsh-hook precmd _update_vcs_info_msg
RPROMPT="%1(v|%F{036}%1v%f|)"
# vim: ft=sh :
