# apt commands
alias install="sudo apt-get install -y"
alias remove="sudo apt-get --purge autoremove"
alias update="sudo apt autoclean && sudo apt autoremove && sudo apt-get update -y && sudo apt-get dist-upgrade -y"
alias clear-cache="sudo apt-get clean"

# general commands
alias cfg='code --wait ~/.zshrc && source ~/.zshrc && echo Zsh config edited and reloaded. && exec zsh' # source ~/.zshrc 
alias sudo='sudo ' # If the last character of the alias value is a blank, then the next command word following the alias is also checked for alias expansion.
alias path='echo -e ${PATH//:/\\n}' # Print each PATH entry on a separate line
alias untar='tar -zxvf'
alias ping='ping -c 5'
alias mv="mv -v" 
alias rm="rm -v"
alias cp="cp -v" 

# safety features
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'

# get top process eating memory
alias psmem="ps -o time,ppid,pid,nice,pcpu,pmem,user,comm -A | sort -n -k 6"
alias psmem5="psmem | tail -5"
alias psmem10="psmem | tail -10"

# get top process eating cpu
alias pscpu="ps -o time,ppid,pid,nice,pcpu,pmem,user,comm -A | sort -n -k 5"
alias pscpu5="pscpu5 | tail -5"
alias pscpu10="pscpu | tail -10"

# ls Commands
alias ls="exa -a --group-directories-first -s=name" # Grid, multiple per line
alias ll="exa -l -a --group-directories-first -s=name -h --git --icons" # Detailed list, 1 per line with git status
alias lst="ls -T" # Contains sub directory (tree)
alias llt="ll -T" # Contains sub directory (tree)

source ~/shell/.docker-alias.sh
source ~/shell/.git-alias.sh
source ~/shell/.mysetup-alias.sh
