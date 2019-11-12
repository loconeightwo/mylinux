export ZSH="/home/vanloc/.oh-my-zsh"
ZSH_THEME="powerlevel9k/powerlevel9k"
plugins=(git adb pip)
source $ZSH/oh-my-zsh.sh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=22'
POWERLEVEL9K_MODE="nerdfont-complete"
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(custom_icon dir vcs)
POWERLEVEL9K_DISABLE_RPROMPT=true
POWERLEVEL9K_VCS_BRANCH_ICON=$'\uF126 '
POWERLEVEL9K_CUSTOM_ICON="echo 﫵"
POWERLEVEL9K_CUSTOM_ICON_FOREGROUND="red"
POWERLEVEL9K_CUSTOM_ICON_BACKGROUND="black"
POWERLEVEL9K_HOME_ICON=''
POWERLEVEL9K_HOME_SUB_ICON=''
POWERLEVEL9K_FOLDER_ICON=''

alias cls='printf "\033c"'

# pip zsh completion start
function _pip_completion {
  local words cword
  read -Ac words
  read -cn cword
  reply=( $( COMP_WORDS="$words[*]" \
             COMP_CWORD=$(( cword-1 )) \
             PIP_AUTO_COMPLETE=1 $words[1] ) )
}
compctl -K _pip_completion pip3
# pip zsh completion end

