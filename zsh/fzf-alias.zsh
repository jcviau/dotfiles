# When no arguments are provided to autojump, display a prompt with the previous navigations
function j() {
    if [[ "$#" -ne 0 ]]; then
        cd $(autojump $@)
        return
    fi
    cd "$(autojump -s | sort -k1gr | awk '$1 ~ /[0-9]:/ && $2 ~ /^\// { for (i=2; i<=NF; i++) { print $(i) } }' |  fzf --height 40% --reverse --inline-info)" 
}

# select branch to checkout
alias igcheckout="git for-each-ref --format='%(refname:short)' refs/heads | fzf | xargs git checkout"

# Select a docker container to attach
function idattach() {
  local cid
  cid=$(docker ps | sed 1d | fzf -1 -q "$1" | awk '{print $1}')

  [ -n "$cid" ] && docker attach "$cid"
}

# Select a docker container to start and attach
function idstart() {
  local cid
  cid=$(docker ps -a -f "status=exited" -f "status=created" | sed 1d | fzf -1 -q "$1" | awk '{print $1}')

  [ -n "$cid" ] && docker start "$cid"
}

# Select a running docker container to stop
function idstop() {
  local cid
  cid=$(docker ps | sed 1d | fzf -q "$1" | awk '{print $1}')

  [ -n "$cid" ] && docker stop "$cid"
}

# Select a docker container to remove
function idrm() {
  local cid
  cid=$(docker ps -a | sed 1d | fzf -q "$1" | awk '{print $1}')

  [ -n "$cid" ] && docker rm "$cid" --force
}

# Select a docker image to remove
function idrmi() {
  local cid
  cid=$(docker image ls | sed 1d | fzf -q "$3" | awk '{print $3}')

  [ -n "$cid" ] && docker rmi "$cid" --force
}

# Select a docker container to run a bash and attach
function idbash() {
  local cid
  cid=$(docker ps | sed 1d | fzf -1 -q "$1" | awk '{print $1}')

  [ -n "$cid" ] && docker exec -it "$cid" /bin/bash
}



# Select a command from history
function ihistory() {
  print -z $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed -r 's/ *[0-9]*\*? *//' | sed -r 's/\\/\\\\/g')
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