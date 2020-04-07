docker volume create portainer_data
docker run -d --name dashboard -p 9000:9000 -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer
sleep 5s
google-chrome http://localhost:9000
