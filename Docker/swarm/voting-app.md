# Assignment: create a multip service multip node web app

## goal : create network, volumes and services for a web based "cats vs dogs" voting app

## services (names below should be services names)
- vote
    - dockersamples/examplevotingapp_vote:before
    - web front end for users to vote dog/cat
    - ideally published on TCP 80. container listens on 80
    - on frontend network
    - 2+ replicas of this contianer