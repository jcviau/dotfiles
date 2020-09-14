#              _
#             | |
#      _______| |__  _ __ ___
#     |_  / __| '_ \| '__/ __|
#    _ / /\__ \ | | | | | (__
#   (_)___|___/_| |_|_|  \___|

export PATH=$HOME/.local/bin:$PATH

# Path to your oh-my-zsh installation.
ZSH="$HOME/.oh-my-zsh"
ZSH_CUSTOM="$HOME/zsh/custom"
ZSH_THEME="powerlevel10k/powerlevel10k"

# Customize theme
[ -f ~/zsh/.p10k-theme-config.sh ] && source ~/zsh/.p10k-theme-config.sh

# Load fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Load autojump
[ -f $HOME/.autojump/etc/profile.d/autojump.sh ] && source $HOME/.autojump/etc/profile.d/autojump.sh

# Load plugin.
source ~/zsh/.plugins.sh

# Load oh-my-zsh library.
source $ZSH/oh-my-zsh.sh

# Add alias and functions
source ~/shell/.alias.sh
source ~/shell/.functions.sh

# cat Commands, using zsh colorize plugin
alias cat="cless"

# Global alias
alias -g G='| grep -i --color=auto --exclude-dir={.git}'

# Default editor
export EDITOR='code'
alias -s {yml,yaml,md,js,ts,html,css,scss,json,xml,.zshrc,.gitconfig,.zsh}=code
alias -s {txt,text}=gedit
