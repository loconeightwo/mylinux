export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="powerlevel9k/powerlevel9k"
plugins=(git adb pip virtualenv docker)
source $ZSH/oh-my-zsh.sh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=22'
POWERLEVEL9K_MODE="nerdfont-complete"
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(custom_icon dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(virtualenv custom_quote)
POWERLEVEL9K_DISABLE_RPROMPT=false
POWERLEVEL9K_VCS_BRANCH_ICON=$'\uF126 '
POWERLEVEL9K_CUSTOM_ICON="echo 﫵"
POWERLEVEL9K_CUSTOM_ICON_FOREGROUND="red"
POWERLEVEL9K_CUSTOM_ICON_BACKGROUND="black"
POWERLEVEL9K_CUSTOM_QUOTE='echo "I can do it "'
POWERLEVEL9K_HOME_ICON=''
POWERLEVEL9K_HOME_SUB_ICON=''
POWERLEVEL9K_FOLDER_ICON=''

source $(dirname $(gem which colorls))/tab_complete.sh
alias ls='colorls --group-directories-first'
alias l='colorls --group-directories-first --almost-all'
alias ll='colorls --group-directories-first --almost-all --long'

alias cls='printf "\033c"'
