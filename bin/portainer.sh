if [ ! "$(docker ps -a | grep dashboard)" ];
then
  echo 'Creating and starting the docker dashboard.'
  docker volume create portainer_data
  docker run -d --name dashboard -p 9000:9000 -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer
  sleep 5s
elif [ "$(docker ps -aq -f status=exited -f name=dashboard)" ]
then
  echo 'Starting the docker dashboard.'
  docker start dashboard
  sleep 5s
fi

google-chrome http://localhost:9000
