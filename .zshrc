export ZSH="/home/vanloc/.oh-my-zsh"
source $(dirname $(gem which colorls))/tab_complete.sh
ZSH_THEME="powerlevel9k/powerlevel9k"
plugins=(git adb pip virtualenv)
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

alias ls='colorls --group-directories-first'
alias l='colorls --group-directories-first --almost-all'
alias ll='colorls --group-directories-first --almost-all --long'

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

filepush() { if [ $# -eq 0 ]; then echo -e "No arguments specified. Usage:\necho filepush /tmp/test.md\ncat /tmp/test.md | filepush test.md"; return 1; fi
tmpfile=$( mktemp -t filepushXXX ); if tty -s; then basefile=$(basename "$1" | sed -e 's/[^a-zA-Z0-9._-]/-/g'); curl --progress-bar --upload-file "$1" "https://filepush.co/upload/$basefile" >> $tmpfile; else curl --progress-bar --upload-file "-" "https://filepush.co/upload/$1" >> $tmpfile ; fi; cat $tmpfile; rm -f $tmpfile; }

# printf "\033c"
