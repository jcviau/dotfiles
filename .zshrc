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
antigen bundle zsh-users/zsh-autosuggestions # use right arrow to use the suggestion
antigen bundle b4b4r07/enhancd  # cd improvement, 2x TAB allows to manually select directory 

# Syntax highlighting bundle. (must be added last)
antigen bundle zsh-users/zsh-syntax-highlighting

# Load theme.
antigen theme romkatv/powerlevel10k

# Customize theme
POWERLEVEL9K_MODE=nerdfont-complete
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(root_indicator ssh dir dir_writable vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status)
POWERLEVEL9K_STATUS_OK=false
# POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
POWERLEVEL9K_SHORTEN_DIR_LENGTH=4

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
alias remove="sudo apt-get --purge autoremove"
alias update=" sudo apt autoclean && sudo apt autoremove && sudo apt-get update -y && sudo apt-get dist-upgrade -y"
alias clear-cache="sudo apt-get clean"
alias path='echo -e ${PATH//:/\\n}' # Print each PATH entry on a separate line

# DEV Commands
alias apps="cd ~/applications/"
alias ws="cd ~/ws/"
alias dotfiles="cd ~/ws/dotfiles"

# ls Commands
alias ols="ls" # Backup, standard ls
alias ls="exa -a --group-directories-first -s=name" # Grid, multiple per line
alias ll="exa -l -a --group-directories-first -s=name -h --git --icons" # Detailed list, 1 per line with git status
alias lst="ls -T" # Contains sub directory (tree)
alias llt="ll -T" # Contains sub directory (tree)

# cat Commands
alias ocat="cat" # Backup, standard cat
alias cat="cless"

# Open VS Code for a specific feature
function code-ui() { code ~/ws/$1/ui }
function code-ingress() { code ~/ws/$1/ingress }
function code-service() { code ~/ws/$1/service }

# Search for files and page it
function search() { find . -iname "*$@*" | less; }

# Search process by name and highlight
function searchps() { ps axuf | grep -v grep | grep "$@" -i --color=auto; }
