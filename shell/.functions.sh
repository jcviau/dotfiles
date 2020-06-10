function mkcd() { mkdir -p "$1"; cd "$1"; }

# Search for files and page it
function search() { find . -iname "*$@*" | less; }

# Search process by name and highlight
function searchps() { ps axuf | grep -v grep | grep "$@" -i --color=auto; }

# Search which process use a port
function searchport() { sudo netstat -tulpn | grep "$1"; }

# When no arguments are provided to autojump, display a prompt with the previous navigations
function j() {
    if [[ "$#" -ne 0 ]]; then
        cd $(autojump $@)
        return
    fi
    cd "$(autojump -s | sort -k1gr | awk '$1 ~ /[0-9]:/ && $2 ~ /^\// { for (i=2; i<=NF; i++) { print $(i) } }' |  fzf --height 40% --reverse --inline-info)" 
}

# Use jump to open a workspace in vs code
function jcode() {
  j $1
  code .
}

# Select a command from history
function ihistory() {
  print -z $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed -r 's/ *[0-9]*\*? *//' | sed -r 's/\\/\\\\/g');
}

# fkill - kill processes - list only the ones you can kill. Modified the earlier script.
function ikill() {
    local pid 
    if [ "$UID" != "0" ]; then
        pid=$(ps -f -u $UID | sed 1d | fzf -m | awk '{print $2}')
    else
        pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')
    fi  

    if [ "x$pid" != "x" ]
    then
        echo $pid | xargs kill -${1:-9}
    fi  
}

source ~/shell/.docker-functions.sh
source ~/shell/.git-functions.sh
