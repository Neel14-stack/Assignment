# Assignment: create a multip service multip node web app

## goal : create network, volumes and services for a web based "cats vs dogs" voting app

## services (names below should be services names)
- vote
    - dockersamples/examplevotingapp_vote:before
    - web front end for users to vote dog/cat
    - ideally published on TCP 80. container listens on 80
    - on frontend network
    - 2+ replicas of this contianer

- redies
    - redis:3.2
    - key/value storage for incoming votes
    - no public ports
    - on frontend network
    - 2 replicas

- worker
    - dockersamples/examplevotingapp_worker
    -backend processor of redis and storing results in postgres
    - no public ports
    - on frontend and backend networks
    - 1 replica

- db
    - postgres:9.4
    - one named volume