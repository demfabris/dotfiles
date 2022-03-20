. "$HOME/.cargo/env"

# Git aliases
alias gl="git log --oneline --decorate --graph --all"
alias gb="git branch -av"
alias gs="git status"
alias gc="git commit --verbose -m $1"

# Some useful
alias vim='nvim'
# Screenshot oneliner
screenshot(){ scrot -s '/tmp/%F_%T_$wx$h.png' -e 'xclip -selection clipboard -target image/png -i $f' }

# ls aliases
alias lll='lsd -lAhS --blocks permission,group,size,date,name  --date relative --group-dirs first'
alias ll='lsd -lAhS --blocks permission,group,size,name --group-dirs first'
alias l='cd_nnn -deHUxc'

# Navigation aliases
alias ..='cd ..'
alias .2='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'

# Some other sys aliases
export SUDO_EDITOR="nvim"
export EDITOR="nvim"
export LANG=pt_BR.UTF-8
export BROWSER=brave-bin
export GIT_AUTHOR_NAME="Fabricio Dematte"

# Rust path
export PATH=${PATH}:${HOME}/.cargo/bin

# [ -z $SSH_CLIENT ] && xkbcomp ~/.xkb $DISPLAY 2>/dev/null
