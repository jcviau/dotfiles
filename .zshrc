source ~/zsh/antigen.zsh

# Load oh-my-zsh library.
export ZSH="$HOME/.oh-my-zsh"
antigen use oh-my-zsh

# Load bundles from the default repo (oh-my-zsh).
antigen bundle git
antigen bundle docker
antigen bundle colorize # ccat/cless command (cat with color)

# Autojump
source /usr/share/autojump/autojump.sh
antigen bundle autojump # j, jc, jo, jco

# Forgit
source ~/zsh/fzf.zsh
antigen bundle 'wfxr/forgit'
forgit_log=glog
forgit_diff=gdiff
forgit_add=gadd
forgit_reset_head=greset-head
forgit_ignore=gignore
forgit_restore=grestore
forgit_clean=gclean
forgit_stash_show=gstash-show

# Load bundles from external repos.
antigen bundle zsh-users/zsh-autosuggestions # use right arrow to use the suggestion
antigen bundle b4b4r07/enhancd  # cd improvement, 2x TAB allows to manually select directory 

# Syntax highlighting bundle. (must be added last)
antigen bundle zsh-users/zsh-syntax-highlighting

# Load theme.
antigen theme romkatv/powerlevel10k

# Customize theme
source ~/zsh/p10k.zsh

# Tell Antigen that you're done.
antigen apply

# Add alias based on fzf (interactive)
source ~/zsh/fzf-alias.zsh

# Add alias/function specific for my setup
source ~/zsh/mysetup-alias.zsh
source ~/zsh/mysetup-function.zsh

# Add alias/function (e.g. improved ls, cat, apt, ...)
source ~/zsh/alias.zsh
source ~/zsh/function.zsh

# Global
alias -g G='| grep -i --color=auto --exclude-dir={.git}'

# Default editor
export EDITOR='code'
alias -s {yml,yaml,md,js,ts,html,css,scss,json,xml,.zshrc,.gitconfig,.zsh}=code
alias -s {txt,text}=gedit
