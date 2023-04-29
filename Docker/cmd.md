- docker container run --publish 80:80 --name roy nginx
- docker container run --publish 80:80 nginx
- To list docker
  - docker container ls 
  - docker container ls -a

- to stop docker
  - docker container stop [docker id]

- to see logs
  -  docker container logs [docker name]
  -  docker container top [docker name]

- we can delete a contatiner while its running
  - although we can force it to delete with command
  - docker container rm [docker id] ( to delete the contianer while its not running)
  - docker container rm -f [docker id] ( to delete a container while its running with force)
