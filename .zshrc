# Custom user path
export ZSH="${HOME}/.config/zsh"

# Extra PATH
export PATH=$PATH:${HOME}/.local/bin:${HOME}/.cargo/bin

# Starship
export STARSHIP_CONFIG="${HOME}/.config/starship/starship.toml"

# Truecolor
export COLORTERM=truecolor

# Dircolors
if [ -x /usr/bin/dircolors ]; then
	test -r ${HOME}/.config/dircolors && eval "$(dircolors -b ~/.config/dircolors/DIR_COLORS)" || eval "$(dircolors -b)"
fi

# Completion
autoload -U compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zmodload zsh/complist
compinit -d "${ZSH}/zcompdump"
_comp_options+=(globdots)

# Instant complete menu
setopt menu_complete

# History
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=${ZSH}/zsh_history

# Load Plugins
for zsh in ${ZSH}/plugins/*.zsh ; do
	[ -r "$zsh" ] && . "$zsh"
done
unset zsh

# Syntax highlighting
source ${ZSH}/fsh/fast-syntax-highlighting.plugin.zsh

# FZF
export FZF_DEFAULT_OPTS='
  --color=dark
  --color fg:#b3b1ad,bg:#1c2328,hl:#59c2ff,fg+:#59c2ff,bg+:#1c2328,hl+:#ff8f40
  --color info:#c2d94c,prompt:#ff8f40,spinner:#f07178,pointer:#ff8f40,marker:#e6b450,header:#665c54
'

export FZF_COMPLETION_OPTS='-i'
export FZF_CTRL_T_COMMAND='ag --hidden --ignore .git --ignore node_modules --ignore Library -g "" 2> /dev/null'
export FZF_ALT_C_COMMAND="find -L . -mindepth 1 \\( -path '*/\\.*' -o -fstype 'sysfs' -o -fstype 'devfs' -o -fstype 'devtmpfs' -o -fstype 'proc' -o -name node_modules \\) -prune -o -type d -print 2> /dev/null | cut -b3-"

# NNN
source ${HOME}/.config/nnn/config.sh

# Load starship
eval "$(starship init zsh)"
