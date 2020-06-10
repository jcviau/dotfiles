# No arguments: `docker ps`
# With arguments: acts like `docker`
function d() {
  if [[ $# > 0 ]]; then
    docker $@
  else
    docker ps
  fi
}

# No arguments: `docker-compose ps`
# With arguments: acts like `docker-compose`
function dc() {
  if [[ $# > 0 ]]; then
    docker-compose $@
  else
    docker-compose ps
  fi
}

# Select a docker container to attach
function idattach() {
  local id
  id=$(docker ps | sed 1d | fzf -1 -q "$1" | awk '{print $1}')

  [ -n "$id" ] && docker attach "$id"
}

# Select a docker container to run a bash and attach
function idbash() {
  local id
  id=$(docker ps | sed 1d | fzf -1 -q "$1" | awk '{print $1}')

  [ -n "$id" ] && docker exec -it "$id" /bin/bash
}

# Select a docker container to start and attach
function idstart() {
  local id
  id=$(docker ps -a -f "status=exited" -f "status=created" | sed 1d | fzf -1 -q "$1" | awk '{print $1}')

  [ -n "$id" ] && docker start "$id"
}

# Select a running docker container to stop
function idstop() {
  local id
  id=$(docker ps | sed 1d | fzf -q "$1" | awk '{print $1}')

  [ -n "$id" ] && docker stop "$id"
}

# Select a docker container to remove
function idrm() {
  local id
  id=$(docker ps -a | sed 1d | fzf -q "$1" | awk '{print $1}')

  [ -n "$id" ] && docker rm "$id" --force
}

# Select a docker image to remove
function idrmi() {
  local id
  id=$(docker image ls | sed 1d | fzf -q "$3" | awk '{print $3}')

  [ -n "$id" ] && docker rmi "$id" --force
}

# Select a docker volume to remove
function idrmv() {
  local id
  id=$(docker volume ls | sed 1d | fzf -q "$2" | awk '{print $2}')

  [ -n "$id" ] && docker volume rm "$id" --force
}

# Select a docker network to remove
function idrmn() {
  local id
  id=$(docker network ls | sed 1d | fzf -q "$1" | awk '{print $1}')

  [ -n "$id" ] && docker network rm "$id"
}
