function mkcd() { mkdir -p "$1"; cd "$1" }

# Search for files and page it
function search() { find . -iname "*$@*" | less; }

# Search process by name and highlight
function searchps() { ps axuf | grep -v grep | grep "$@" -i --color=auto; }

# Search which process use a port
function searchport() { sudo netstat -tulpn | grep "$1" }

# No arguments: `git status`
# With arguments: acts like `git`
function g() {
  if [[ $# > 0 ]]; then
    git $@
  else
    git status
  fi
}

# No arguments: `docker ps`
# With arguments: acts like `dpcker`
function d() {
  if [[ $# > 0 ]]; then
    docker $@
  else
    docker ps
  fi
}