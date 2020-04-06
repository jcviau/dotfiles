source ./antigen.zsh

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

# Load bundles from external repos.
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle b4b4r07/enhancd

# Syntax highlighting bundle. (must be added last)
antigen bundle zsh-users/zsh-syntax-highlighting

# Load theme.
antigen theme romkatv/powerlevel10k
POWERLEVEL9K_DISABLE_RPROMPT=true
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true

# Tell Antigen that you're done.
antigen apply

# Default editor
export EDITOR='code'
alias -s {yml,yaml,md,js,ts,html,css,scss,json,xml,sh}=code
alias -s {txt,.gitconfig,.zshrc}=gedit

# Global Alias
alias -g G='| grep -i --color=auto --exclude-dir={.git}'

# Helper Commands
alias install="sudo apt-get install -y"
alias remove="sudo apt-get remove --purge"
alias path='echo -e ${PATH//:/\\n}' # Print each PATH entry on a separate line

# DEV Commands
alias putty-s0="sudo putty /dev/ttyS0 -serial -sercfg 115200,8,n,1,N"
alias ws="cd ~/ws/"
alias dt="code ~/ws/dt-client"

# ls Commands
alias ols="ls" # Backup, standard ls
alias ls="exa -a --group-directories-first -s=name" # Grid, multiple per line
alias ll="exa -l -a --group-directories-first -s=name -h --git --icons" # Detailed list, 1 per line with git status
alias lst="ls -T" # Contains sub directory (tree)
alias llt="ll -T" # Contains sub directory (tree)

# cat Commands
alias ocat="cat" # Backup, standard cat
alias cat="cless"

# Search for files and page it
function search() { find . -iname "*$@*" | less; }

# Search process by name and highlight
function searchps() { ps axuf | grep -v grep | grep "$@" -i --color=auto; }

# Search process that use a port
function searchport() { lsof -i tcp:$1 }
